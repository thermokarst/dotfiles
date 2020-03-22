import json


qiime2_projects = [
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
]

cap_lab_projects = [
    'caporaso-lab.github.io',
    'pretrained-feature-classifiers',
]

gregcaporaso_projects = [
    'caporaso-lab-secrets',
    'qiime2-meta-figures',
]

projects = []

def record(name, path):
    return {
        'name': name,
        'path': path,
    }

Record = lambda x, y: record(x.lower(), '/'.join([y, x]))

for proj in qiime2_projects:
    projects.append(Record(proj, '/Users/matthew/src/qiime2'))

for proj in cap_lab_projects:
    projects.append(Record(proj, '/Users/matthew/src/caporaso-lab'))

for proj in gregcaporaso_projects:
    projects.append(Record(proj, '/Users/matthew/src/gregcaporaso'))

projects.append(record('dotfiles', '$home/.dotfiles', ''))

with open('vscode/qiime2.code-workspace', 'w') as fh:
    json.dump({'folders': projects}, fh, sort_keys=True, indent=4)
