import json
import os


projects = {
    'qiime2': [
        'Keemei',
        'busywork',
        'data.qiime2.org',
        'dev-docs',
        'discourse-unhandled-tagger',
        'docs',
        'environment-files',
        'galaxy',
        'library',
        'logos',
        'q2-alignment',
        'q2-composition',
        'q2-cutadapt',
        'q2-dada2',
        'q2-deblur',
        'q2-demux',
        'q2-diversity',
        'q2-diversity-lib',
        'q2-emperor',
        'q2-feature-classifier',
        'q2-feature-table',
        'q2-fragment-insertion',
        'q2-gneiss',
        'q2-longitudinal',
        'q2-metadata',
        'q2-phylogeny',
        'q2-quality-control',
        'q2-quality-filter',
        'q2-sample-classifier',
        'q2-taxa',
        'q2-types',
        'q2-vsearch',
        'q2cli',
        'q2cwl',
        'q2galaxy',
        'q2studio',
        'q2templates',
        'q2view',
        'qiime2',
        'qiime2.github.io',
        'template-repo',
        'view.qiime2.org',
        'vm-playbooks',
        'workshop-playbooks',
        'workshops.qiime2.org',
    ],

    'caporaso-lab': [
        'caporaso-lab.github.io',
        'pretrained-feature-classifiers',
    ],

    'gregcaporaso': [
        'caporaso-lab-secrets',
        'qiime2-meta-figures',
    ],
}

folders = []
for org, repos in projects.items():
    for repo in repos:
        folders.append({
            'name': repo.lower(),
            'path': os.path.join(os.sep, 'Users', 'matthew', 'src', org, repo)
        })


folders.append({'name': 'dotfiles',
                'path': os.path.join(os.sep, 'Users', 'matthew', '.dotfiles')})


with open('vscode/qiime2.code-workspace', 'w') as fh:
    json.dump({'folders': sorted(folders, key=lambda x: x['name'])}, fh, sort_keys=True, indent=4)
