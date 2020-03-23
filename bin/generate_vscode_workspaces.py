import json
import os

from qiime2_projects import PROJECTS as Q2_PROJECTS


def render_vscode_workspace(projects, output_fp, include_dotfiles=False):
    folders = []
    for org, repos in projects.items():
        for repo in repos:
            fp = os.path.join('~', 'projects', 'qiime2', repo)
            fp = os.path.expanduser(fp)
            folders.append({
                'name': repo.lower(),
                'path': fp,
            })

    if include_dotfiles:
        dotfile_fp = os.path.join(os.sep, 'Users', 'matthew', '.dotfiles')
        folders.append({'name': 'dotfiles',
                        'path': dotfile_fp})

    with open(output_fp, 'w') as fh:
        json.dump({'folders': sorted(folders, key=lambda x: x['name'])},
                  fh, sort_keys=True, indent=4)


if __name__ == '__main__':
    render_vscode_workspace(
        Q2_PROJECTS,
        os.path.join('vscode', 'qiime2.code-workspace'),
        include_dotfiles=True,
    )
