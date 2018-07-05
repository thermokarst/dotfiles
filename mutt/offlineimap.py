import re
import subprocess


def get_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-internet-password',
        'account': account,
        'server': server,
        'keychain': '/Users/matthew/Library/Keychains/login.keychain',
    }
    command = 'sudo -u matthew %(security)s -v %(command)s -g ' \
              '-a %(account)s -s %(server)s %(keychain)s' % params
    output = subprocess.check_output(command, shell=True,
                                     stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines() if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)


if __name__ == "__main__":
    import sys
    print(get_pass(sys.argv[1], sys.argv[2]))
