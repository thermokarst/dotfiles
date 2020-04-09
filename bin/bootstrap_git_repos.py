import json
import os
import subprocess

from qiime2_projects import PROJECTS as Q2_PROJECTS
from mds_projects import PROJECTS as MDS_PROJECTS
from personal_projects import PROJECTS as PERSONAL_PROJECTS


def fetch_projects(projects, base_fp, remotes):
    for org, repos in projects.items():
        base_fp = os.path.join('~', 'projects', base_fp)
        base_fp = os.path.expanduser(base_fp)

        for repo in repos:
            print('repo: %s/%s' % (org, repo))

            repo_fp = os.path.join(base_fp, repo)
            repo_fp = os.path.expanduser(repo_fp)
            if not os.path.isdir(repo_fp):
                url = 'https://github.com/%s/%s' % (org, repo)
                subprocess.run(['git', 'clone', url, repo_fp])
                subprocess.run(['git', 'remote', 'rename', 'origin', org],
                               cwd=repo_fp)
            for remote in remotes:
                url = 'https://github.com/%s/%s' % (remote, repo)
                try:
                    subprocess.run(['git', 'remote', 'add', remote, url],
                                   cwd=repo_fp, check=True,
                                   capture_output=True)
                except subprocess.CalledProcessError as e:
                    msg = 'remote %s already exists' % (remote, )
                    if msg not in str(e.stderr):
                        raise

                try:
                    subprocess.run(['git', 'fetch', remote],
                                   cwd=repo_fp, check=True,
                                   capture_output=True)
                except subprocess.CalledProcessError as e:
                    if url not in str(e.stderr):
                        raise
                    else:
                        subprocess.run(['git', 'remote', 'remove', remote],
                                       cwd=repo_fp)


if __name__ == '__main__':
    remotes = ['thermokarst', 'ebolyen', 'gregcaporaso', 'ChrisKeefe',
               'Oddant1', 'nbokulich', 'andrewsanchez']

    fetch_projects(Q2_PROJECTS, 'qiime2', remotes)
    fetch_projects(MDS_PROJECTS, 'mds', [])
    fetch_projects(PERSONAL_PROJECTS, 'personal', [])
