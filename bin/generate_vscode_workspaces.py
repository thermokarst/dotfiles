import json
import os

from qiime2_projects import PROJECTS as Q2_PROJECTS
from mds_projects import PROJECTS as MDS_PROJECTS


def render_vscode_workspace(projects, project_name, output_fp,
                            include_dotfiles=True, extra_dirs=None):
    folders = []
    for org, repos in projects.items():
        for repo in repos:
            fp = os.path.join('~', 'projects', project_name, repo)
            fp = os.path.expanduser(fp)
            folders.append({'name': repo.lower(),
                            'path': fp})

    if include_dotfiles:
        dotfile_fp = os.path.join(os.sep, 'Users', 'matthew', '.dotfiles')
        folders.append({'name': 'dotfiles',
                        'path': dotfile_fp})

    if extra_dirs is not None:
        for name, path in extra_dirs.items():
            fp = os.path.join('~', 'projects', project_name, path)
            fp = os.path.expanduser(fp)
            folders.append({'name': name,
                            'path': fp})

    with open(output_fp, 'w') as fh:
        json.dump({'folders': sorted(folders, key=lambda x: x['name'])},
                  fh, sort_keys=True, indent=4)


if __name__ == '__main__':
    render_vscode_workspace(
        Q2_PROJECTS,
        'qiime2',
        os.path.join('vscode', 'qiime2.code-workspace'),
        extra_dirs={'data': 'data'},
    )

    render_vscode_workspace(
        MDS_PROJECTS,
        'mds',
        os.path.join('vscode', 'mds.code-workspace'),
    )
