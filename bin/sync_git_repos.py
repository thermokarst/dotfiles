import configparser
import os
import sys

import pygit2


def init_repo(repo_name, repo_fp, remote, remote_name, callbacks,
              github_peers):
    repo = pygit2.discover_repository(repo_fp)
    if repo is None:
        print('cloning %s' % remote)

        init_remote = lambda r, n, u: r.remotes.create(remote_name, u)
        repo = pygit2.clone_repository(remote, repo_fp, remote=init_remote,
                                       callbacks=callbacks)
    else:
        print('already cloned %s' % remote)

        repo = pygit2.Repository(repo)

    for peer in github_peers:
        url = 'ssh://git@github.com/%s/%s' % (peer, repo_name)

        try:
            repo.remotes[peer]
        except KeyError:
            repo.remotes.create(peer, url)

        if repo.remotes[peer].url != url:
            repo.remotes.set_url(peer, url)


def sync_workspace(workspace_fp, repos, remote_host, remote_name, callbacks,
                   github_peers):
    if not os.path.exists(workspace_fp):
        os.makedirs(workspace_fp)

    for repo in repos:
        repo_fp = os.path.join(workspace_fp, repo)
        remote = 'ssh://%s/%s' % (remote_host, repo)

        init_repo(repo, repo_fp, remote, remote_name, callbacks, github_peers)


def setup_callbacks():
    pub_fp = os.path.expanduser('~/.ssh/id_ecdsa.pub')
    priv_fp = os.path.expanduser('~/.ssh/id_ecdsa')
    keypair = pygit2.Keypair('git', pub_fp, priv_fp, '')
    callbacks = pygit2.RemoteCallbacks(credentials=keypair)
    return callbacks


if __name__ == '__main__':
    ini_fp = sys.argv[1]
    cfg = configparser.ConfigParser()
    cfg.read(ini_fp)

    callbacks = setup_callbacks()

    for section in cfg.sections():
        workspace_fp = cfg[section]['workspace']
        workspace_fp = os.path.expanduser(workspace_fp)

        repos = cfg[section]['repos'].split(',')
        repos = [r.strip() for r in repos]
        remote_host = cfg[section]['remote_host']
        remote_name = cfg[section]['remote_name']

        github_peers = cfg[section]['github_peers'].split(',')
        if github_peers == ['']:
            github_peers = []

        sync_workspace(workspace_fp, repos, remote_host,
                       remote_name, callbacks, github_peers)
