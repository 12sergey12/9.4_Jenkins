# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
2. Установить Jenkins при помощи playbook.
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.

## Основная часть

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.

```
Started by user admin
Running as SYSTEM
Building on the built-in node in workspace /var/lib/jenkins/workspace/freestyle
The recommended git tool is: NONE
using credential jenkins-ssh
 > git rev-parse --resolve-git-dir /var/lib/jenkins/workspace/freestyle/.git # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url git@github.com:12sergey12/my.git # timeout=10
Fetching upstream changes from git@github.com:12sergey12/my.git
 > git --version # timeout=10
 > git --version # 'git version 1.8.3.1'
using GIT_SSH to set credentials jenkins-ssh
[INFO] Currently running in a labeled security context
[INFO] Currently SELinux is 'enforcing' on the host
 > /usr/bin/chcon --type=ssh_home_t /var/lib/jenkins/workspace/freestyle@tmp/jenkins-gitclient-ssh14809875177297618830.key
Verifying host key using known hosts file
 > git fetch --tags --progress git@github.com:12sergey12/my.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
Checking out Revision 97ed68c6fa8b91e52a42ee5b9e49b59de30852a1 (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 97ed68c6fa8b91e52a42ee5b9e49b59de30852a1 # timeout=10
Commit message: "Update molecule.yml"
 > git rev-list --no-walk 97ed68c6fa8b91e52a42ee5b9e49b59de30852a1 # timeout=10
[freestyle] $ /bin/sh -xe /tmp/jenkins1518097538837371410.sh
+ ls -la
total 0
drwxr-xr-x. 4 jenkins jenkins  32 Feb  9 15:51 .
drwxr-xr-x. 4 jenkins jenkins  44 Feb  9 15:03 ..
drwxr-xr-x. 8 jenkins jenkins 162 Feb  9 16:07 .git
drwxr-xr-x. 9 jenkins jenkins 164 Feb  9 15:51 vector
+ cd vector
+ ls -la
total 12
drwxr-xr-x. 9 jenkins jenkins  164 Feb  9 15:51 .
drwxr-xr-x. 4 jenkins jenkins   32 Feb  9 15:51 ..
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 defaults
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 handlers
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 meta
drwxr-xr-x. 4 jenkins jenkins   35 Feb  9 15:51 molecule
-rw-r--r--. 1 jenkins jenkins 1622 Feb  9 15:51 README.md
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 tasks
drwxr-xr-x. 2 jenkins jenkins   39 Feb  9 15:51 tests
-rw-r--r--. 1 jenkins jenkins  275 Feb  9 15:51 tox.ini
-rw-r--r--. 1 jenkins jenkins   91 Feb  9 15:51 tox-requirements.txt
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 vars
+ python3 -m pip install --user cowsay
Requirement already satisfied: cowsay in /home/jenkins/.local/lib/python3.6/site-packages (6.0)
+ pip3 install --user ansible-lint==5.4.0
Requirement already satisfied: ansible-lint==5.4.0 in /home/jenkins/.local/lib/python3.6/site-packages (5.4.0)
Requirement already satisfied: ruamel.yaml<1,>=0.15.34 in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (0.18.3)
Requirement already satisfied: tenacity in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (8.2.2)
Requirement already satisfied: rich>=9.5.1 in /usr/local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (12.6.0)
Requirement already satisfied: typing-extensions in /usr/local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (4.1.1)
Requirement already satisfied: wcmatch>=7.0 in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (8.3)
Requirement already satisfied: enrich>=1.2.6 in /usr/local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (1.2.7)
Requirement already satisfied: packaging in /usr/local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (21.3)
Requirement already satisfied: pyyaml in /home/jenkins/.local/lib/python3.6/site-packages (from ansible-lint==5.4.0) (5.4.1)
Requirement already satisfied: pygments<3.0.0,>=2.6.0 in /usr/local/lib/python3.6/site-packages (from rich>=9.5.1->ansible-lint==5.4.0) (2.14.0)
Requirement already satisfied: commonmark<0.10.0,>=0.9.0 in /usr/local/lib/python3.6/site-packages (from rich>=9.5.1->ansible-lint==5.4.0) (0.9.1)
Requirement already satisfied: dataclasses<0.9,>=0.7 in /usr/local/lib/python3.6/site-packages (from rich>=9.5.1->ansible-lint==5.4.0) (0.8)
Requirement already satisfied: ruamel.yaml.clib>=0.2.7 in /home/jenkins/.local/lib/python3.6/site-packages (from ruamel.yaml<1,>=0.15.34->ansible-lint==5.4.0) (0.2.8)
Requirement already satisfied: bracex>=2.1.1 in /home/jenkins/.local/lib/python3.6/site-packages (from wcmatch>=7.0->ansible-lint==5.4.0) (2.2.1)
Requirement already satisfied: pyparsing!=3.0.5,>=2.0.2 in /usr/local/lib/python3.6/site-packages (from packaging->ansible-lint==5.4.0) (3.1.1)
+ pip3 install --user parser-libraries
Requirement already satisfied: parser-libraries in /home/jenkins/.local/lib/python3.6/site-packages (3.7)
Requirement already satisfied: pymysql in /home/jenkins/.local/lib/python3.6/site-packages (from parser-libraries) (1.0.2)
Requirement already satisfied: openpy in /home/jenkins/.local/lib/python3.6/site-packages (from parser-libraries) (0.0.2)
Requirement already satisfied: requests in /usr/local/lib/python3.6/site-packages (from parser-libraries) (2.25.1)
Requirement already satisfied: bs4 in /home/jenkins/.local/lib/python3.6/site-packages (from parser-libraries) (0.0.2)
Requirement already satisfied: selenium in /home/jenkins/.local/lib/python3.6/site-packages (from parser-libraries) (3.141.0)
Requirement already satisfied: pytelegrambotapi in /home/jenkins/.local/lib/python3.6/site-packages (from parser-libraries) (4.15.4)
Requirement already satisfied: cryptography in /usr/local/lib64/python3.6/site-packages (from parser-libraries) (40.0.2)
Requirement already satisfied: urllib3 in /usr/local/lib/python3.6/site-packages (from parser-libraries) (1.25.8)
Requirement already satisfied: beautifulsoup4 in /home/jenkins/.local/lib/python3.6/site-packages (from bs4->parser-libraries) (4.12.3)
Requirement already satisfied: cffi>=1.12 in /usr/local/lib64/python3.6/site-packages (from cryptography->parser-libraries) (1.15.1)
Requirement already satisfied: s3fs in /home/jenkins/.local/lib/python3.6/site-packages (from openpy->parser-libraries) (2022.1.0)
Requirement already satisfied: certifi>=2017.4.17 in /usr/local/lib/python3.6/site-packages (from requests->parser-libraries) (2024.2.2)
Requirement already satisfied: idna<3,>=2.5 in /usr/local/lib/python3.6/site-packages (from requests->parser-libraries) (2.10)
Requirement already satisfied: chardet<5,>=3.0.2 in /usr/local/lib/python3.6/site-packages (from requests->parser-libraries) (4.0.0)
Requirement already satisfied: pycparser in /usr/local/lib/python3.6/site-packages (from cffi>=1.12->cryptography->parser-libraries) (2.21)
Requirement already satisfied: soupsieve>1.2 in /home/jenkins/.local/lib/python3.6/site-packages (from beautifulsoup4->bs4->parser-libraries) (2.3.2.post1)
Requirement already satisfied: aiobotocore~=2.1.0 in /home/jenkins/.local/lib/python3.6/site-packages (from s3fs->openpy->parser-libraries) (2.1.2)
Requirement already satisfied: fsspec==2022.01.0 in /home/jenkins/.local/lib/python3.6/site-packages (from s3fs->openpy->parser-libraries) (2022.1.0)
Requirement already satisfied: aiohttp<=4 in /home/jenkins/.local/lib/python3.6/site-packages (from s3fs->openpy->parser-libraries) (3.8.6)
Requirement already satisfied: botocore<1.23.25,>=1.23.24 in /home/jenkins/.local/lib/python3.6/site-packages (from aiobotocore~=2.1.0->s3fs->openpy->parser-libraries) (1.23.24)
Requirement already satisfied: wrapt>=1.10.10 in /home/jenkins/.local/lib/python3.6/site-packages (from aiobotocore~=2.1.0->s3fs->openpy->parser-libraries) (1.16.0)
Requirement already satisfied: aioitertools>=0.5.1 in /home/jenkins/.local/lib/python3.6/site-packages (from aiobotocore~=2.1.0->s3fs->openpy->parser-libraries) (0.11.0)
Requirement already satisfied: async-timeout<5.0,>=4.0.0a3 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (4.0.2)
Requirement already satisfied: aiosignal>=1.1.2 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (1.2.0)
Requirement already satisfied: multidict<7.0,>=4.5 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (5.2.0)
Requirement already satisfied: attrs>=17.3.0 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (22.2.0)
Requirement already satisfied: charset-normalizer<4.0,>=2.0 in /usr/local/lib64/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (3.0.1)
Requirement already satisfied: frozenlist>=1.1.1 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (1.2.0)
Requirement already satisfied: typing-extensions>=3.7.4 in /usr/local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (4.1.1)
Requirement already satisfied: idna-ssl>=1.0 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (1.1.0)
Requirement already satisfied: yarl<2.0,>=1.0 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (1.7.2)
Requirement already satisfied: asynctest==0.13.0 in /home/jenkins/.local/lib/python3.6/site-packages (from aiohttp<=4->s3fs->openpy->parser-libraries) (0.13.0)
Requirement already satisfied: python-dateutil<3.0.0,>=2.1 in /usr/local/lib/python3.6/site-packages (from botocore<1.23.25,>=1.23.24->aiobotocore~=2.1.0->s3fs->openpy->parser-libraries) (2.8.2)
Requirement already satisfied: jmespath<1.0.0,>=0.7.1 in /home/jenkins/.local/lib/python3.6/site-packages (from botocore<1.23.25,>=1.23.24->aiobotocore~=2.1.0->s3fs->openpy->parser-libraries) (0.10.0)
Requirement already satisfied: six>=1.5 in /usr/local/lib/python3.6/site-packages (from python-dateutil<3.0.0,>=2.1->botocore<1.23.25,>=1.23.24->aiobotocore~=2.1.0->s3fs->openpy->parser-libraries) (1.16.0)
+ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/home/jenkins/.local/bin
+ pip3 install --user yamllint
Requirement already satisfied: yamllint in /home/jenkins/.local/lib/python3.6/site-packages (1.24.2)
Requirement already satisfied: pyyaml in /home/jenkins/.local/lib/python3.6/site-packages (from yamllint) (5.4.1)
Requirement already satisfied: pathspec>=0.5.3 in /home/jenkins/.local/lib/python3.6/site-packages (from yamllint) (0.9.0)
+ pip3 install --user urllib3
Requirement already satisfied: urllib3 in /usr/local/lib/python3.6/site-packages (1.25.8)
+ pip3 install --user ansible_compat
Requirement already satisfied: ansible_compat in /usr/local/lib/python3.6/site-packages (1.0.0)
Requirement already satisfied: subprocess-tee>=0.3.5 in /usr/local/lib/python3.6/site-packages (from ansible_compat) (0.3.5)
Requirement already satisfied: PyYAML in /home/jenkins/.local/lib/python3.6/site-packages (from ansible_compat) (5.4.1)
Requirement already satisfied: cached-property~=1.5 in /usr/local/lib/python3.6/site-packages (from ansible_compat) (1.5.2)
+ python3 -m pip --version
pip 21.3.1 from /usr/local/lib/python3.6/site-packages/pip (python 3.6)
+ molecule --version
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
molecule 3.5.2 using python 3.6 
    ansible:2.10.17
    delegated:3.5.2 from molecule
    docker:1.1.0 from molecule_docker requiring collections: community.docker>=1.9.1
+ ls -la
total 12
drwxr-xr-x. 9 jenkins jenkins  164 Feb  9 15:51 .
drwxr-xr-x. 4 jenkins jenkins   32 Feb  9 15:51 ..
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 defaults
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 handlers
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 meta
drwxr-xr-x. 4 jenkins jenkins   35 Feb  9 15:51 molecule
-rw-r--r--. 1 jenkins jenkins 1622 Feb  9 15:51 README.md
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 tasks
drwxr-xr-x. 2 jenkins jenkins   39 Feb  9 15:51 tests
-rw-r--r--. 1 jenkins jenkins  275 Feb  9 15:51 tox.ini
-rw-r--r--. 1 jenkins jenkins   91 Feb  9 15:51 tox-requirements.txt
drwxr-xr-x. 2 jenkins jenkins   22 Feb  9 15:51 vars
+ molecule test
/usr/local/lib/python3.6/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.6 is no longer supported by the Python core team. Therefore, support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.6.
  from cryptography.exceptions import InvalidSignature
INFO     default scenario test matrix: dependency, lint, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/home/jenkins/.cache/ansible-compat/ada10c/modules:/home/jenkins/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/home/jenkins/.cache/ansible-compat/ada10c/collections:/home/jenkins/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/home/jenkins/.cache/ansible-compat/ada10c/roles:/home/jenkins/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > lint
COMMAND: ansible-lint .
yamllint .

WARNING: PATH altered to include /usr/bin
Traceback (most recent call last):
  File "/home/jenkins/.local/bin/ansible-lint", line 8, in <module>
    sys.exit(_run_cli_entrypoint())
  File "/home/jenkins/.local/lib/python3.6/site-packages/ansiblelint/__main__.py", line 246, in _run_cli_entrypoint
    sys.exit(main(sys.argv))
  File "/home/jenkins/.local/lib/python3.6/site-packages/ansiblelint/__main__.py", line 158, in main
    prepare_environment()
  File "/home/jenkins/.local/lib/python3.6/site-packages/ansiblelint/prerun.py", line 209, in prepare_environment
    _install_galaxy_role()
  File "/home/jenkins/.local/lib/python3.6/site-packages/ansiblelint/prerun.py", line 250, in _install_galaxy_role
    yaml = yaml_from_file("meta/main.yml")
  File "/home/jenkins/.local/lib/python3.6/site-packages/ansiblelint/loaders.py", line 10, in yaml_from_file
    return yaml.load(content, Loader=yaml.FullLoader)
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/__init__.py", line 114, in load
    return loader.get_single_data()
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/constructor.py", line 49, in get_single_data
    node = self.get_single_node()
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/composer.py", line 36, in get_single_node
    document = self.compose_document()
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/composer.py", line 55, in compose_document
    node = self.compose_node(None, None)
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/composer.py", line 84, in compose_node
    node = self.compose_mapping_node(anchor)
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/composer.py", line 133, in compose_mapping_node
    item_value = self.compose_node(node, item_key)
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/composer.py", line 84, in compose_node
    node = self.compose_mapping_node(anchor)
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/composer.py", line 127, in compose_mapping_node
    while not self.check_event(MappingEndEvent):
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/parser.py", line 98, in check_event
    self.current_event = self.state()
  File "/home/jenkins/.local/lib/python3.6/site-packages/yaml/parser.py", line 439, in parse_block_mapping_key
    "expected <block end>, but found %r" % token.id, token.start_mark)
yaml.parser.ParserError: while parsing a block mapping
  in "meta/main.yml", line 2, column 3
expected <block end>, but found '<block mapping start>'
  in "meta/main.yml", line 34, column 6
./meta/main.yml
  1:1       warning  missing document start "---"  (document-start)
  7:1       error    trailing spaces  (trailing-spaces)
  23:81     error    line too long (84 > 80 characters)  (line-length)
  27:81     error    line too long (84 > 80 characters)  (line-length)
  28:81     error    line too long (85 > 80 characters)  (line-length)
  31:4      warning  comment not indented like content  (comments-indentation)
  33:8      error    wrong indentation: expected 4 but found 7  (indentation)
  34:6      error    syntax error: expected <block end>, but found '<block mapping start>' (syntax)
  35:6      error    wrong indentation: expected 7 but found 5  (indentation)
  45:5      warning  comment not indented like content  (comments-indentation)
  45:81     error    line too long (83 > 80 characters)  (line-length)
  46:81     error    line too long (82 > 80 characters)  (line-length)
  49:81     error    line too long (83 > 80 characters)  (line-length)
  53:3      warning  comment not indented like content  (comments-indentation)
  53:81     error    line too long (85 > 80 characters)  (line-length)

./molecule/default/converge.yml
  1:2       warning  missing starting space in comment  (comments)
  2:2       warning  missing starting space in comment  (comments)
  26:81     error    line too long (118 > 80 characters)  (line-length)
  33:81     error    line too long (117 > 80 characters)  (line-length)
  55:1      warning  comment not indented like content  (comments-indentation)
  56:81     error    line too long (127 > 80 characters)  (line-length)
  68:28     error    no new line character at the end of file  (new-line-at-end-of-file)

./molecule/podman/converge.yml
  10:1      warning  comment not indented like content  (comments-indentation)

./molecule/podman/molecule.yml
  39:14     error    no new line character at the end of file  (new-line-at-end-of-file)

./tasks/main.yml
  6:81      error    line too long (112 > 80 characters)  (line-length)
  29:25     error    trailing spaces  (trailing-spaces)

CRITICAL Lint failed with error code 1
WARNING  An error occurred during the test sequence action: 'lint'. Cleaning up.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     Sanity checks: 'docker'
Traceback (most recent call last):
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 118, in execute_cmdline_scenarios
    execute_scenario(scenario)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 160, in execute_scenario
    execute_subcommand(scenario.config, action)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 149, in execute_subcommand
    return command(config).execute()
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/logger.py", line 188, in wrapper
    rt = func(*args, **kwargs)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/lint.py", line 100, in execute
    "Lint failed with error code %s" % result.returncode
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/util.py", line 118, in sysexit_with_message
    sysexit(code)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/util.py", line 96, in sysexit
    sys.exit(code)
SystemExit: 1

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 672, in urlopen
    chunked=chunked,
  File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 387, in _make_request
    conn.request(method, url, **httplib_request_kw)
  File "/usr/lib64/python3.6/http/client.py", line 1254, in request
    self._send_request(method, url, body, headers, encode_chunked)
  File "/usr/lib64/python3.6/http/client.py", line 1300, in _send_request
    self.endheaders(body, encode_chunked=encode_chunked)
  File "/usr/lib64/python3.6/http/client.py", line 1249, in endheaders
    self._send_output(message_body, encode_chunked=encode_chunked)
  File "/usr/lib64/python3.6/http/client.py", line 1036, in _send_output
    self.send(msg)
  File "/usr/lib64/python3.6/http/client.py", line 974, in send
    self.connect()
  File "/usr/local/lib/python3.6/site-packages/docker/transport/unixconn.py", line 30, in connect
    sock.connect(self.unix_socket)
PermissionError: [Errno 13] Permission denied

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/site-packages/requests/adapters.py", line 449, in send
    timeout=timeout
  File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 720, in urlopen
    method, url, error=e, _pool=self, _stacktrace=sys.exc_info()[2]
  File "/usr/local/lib/python3.6/site-packages/urllib3/util/retry.py", line 400, in increment
    raise six.reraise(type(error), error, _stacktrace)
  File "/usr/local/lib/python3.6/site-packages/urllib3/packages/six.py", line 734, in reraise
    raise value.with_traceback(tb)
  File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 672, in urlopen
    chunked=chunked,
  File "/usr/local/lib/python3.6/site-packages/urllib3/connectionpool.py", line 387, in _make_request
    conn.request(method, url, **httplib_request_kw)
  File "/usr/lib64/python3.6/http/client.py", line 1254, in request
    self._send_request(method, url, body, headers, encode_chunked)
  File "/usr/lib64/python3.6/http/client.py", line 1300, in _send_request
    self.endheaders(body, encode_chunked=encode_chunked)
  File "/usr/lib64/python3.6/http/client.py", line 1249, in endheaders
    self._send_output(message_body, encode_chunked=encode_chunked)
  File "/usr/lib64/python3.6/http/client.py", line 1036, in _send_output
    self.send(msg)
  File "/usr/lib64/python3.6/http/client.py", line 974, in send
    self.connect()
  File "/usr/local/lib/python3.6/site-packages/docker/transport/unixconn.py", line 30, in connect
    sock.connect(self.unix_socket)
urllib3.exceptions.ProtocolError: ('Connection aborted.', PermissionError(13, 'Permission denied'))

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/lib/python3.6/site-packages/docker/api/client.py", line 214, in _retrieve_server_version
    return self.version(api_version=False)["ApiVersion"]
  File "/usr/local/lib/python3.6/site-packages/docker/api/daemon.py", line 181, in version
    return self._result(self._get(url), json=True)
  File "/usr/local/lib/python3.6/site-packages/docker/utils/decorators.py", line 46, in inner
    return f(self, *args, **kwargs)
  File "/usr/local/lib/python3.6/site-packages/docker/api/client.py", line 237, in _get
    return self.get(url, **self._set_request_timeout(kwargs))
  File "/usr/local/lib/python3.6/site-packages/requests/sessions.py", line 555, in get
    return self.request('GET', url, **kwargs)
  File "/usr/local/lib/python3.6/site-packages/requests/sessions.py", line 542, in request
    resp = self.send(prep, **send_kwargs)
  File "/usr/local/lib/python3.6/site-packages/requests/sessions.py", line 655, in send
    r = adapter.send(request, **kwargs)
  File "/usr/local/lib/python3.6/site-packages/requests/adapters.py", line 498, in send
    raise ConnectionError(err, request=request)
requests.exceptions.ConnectionError: ('Connection aborted.', PermissionError(13, 'Permission denied'))

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/molecule", line 8, in <module>
    sys.exit(main())
  File "/usr/local/lib/python3.6/site-packages/click/core.py", line 1128, in __call__
    return self.main(*args, **kwargs)
  File "/usr/local/lib/python3.6/site-packages/click/core.py", line 1053, in main
    rv = self.invoke(ctx)
  File "/usr/local/lib/python3.6/site-packages/click/core.py", line 1659, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
  File "/usr/local/lib/python3.6/site-packages/click/core.py", line 1395, in invoke
    return ctx.invoke(self.callback, **ctx.params)
  File "/usr/local/lib/python3.6/site-packages/click/core.py", line 754, in invoke
    return __callback(*args, **kwargs)
  File "/usr/local/lib/python3.6/site-packages/click/decorators.py", line 26, in new_func
    return f(get_current_context(), *args, **kwargs)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/test.py", line 159, in test
    base.execute_cmdline_scenarios(scenario_name, args, command_args, ansible_args)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 129, in execute_cmdline_scenarios
    execute_subcommand(scenario.config, "destroy")
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/base.py", line 149, in execute_subcommand
    return command(config).execute()
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/logger.py", line 188, in wrapper
    rt = func(*args, **kwargs)
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/command/destroy.py", line 107, in execute
    self._config.provisioner.destroy()
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/provisioner/ansible.py", line 705, in destroy
    pb.execute()
  File "/home/jenkins/.local/lib/python3.6/site-packages/molecule/provisioner/ansible_playbook.py", line 110, in execute
    self._config.driver.sanity_checks()
  File "/usr/local/lib/python3.6/site-packages/molecule_docker/driver.py", line 236, in sanity_checks
    docker_client = docker.from_env()
  File "/usr/local/lib/python3.6/site-packages/docker/client.py", line 101, in from_env
    **kwargs_from_env(**kwargs)
  File "/usr/local/lib/python3.6/site-packages/docker/client.py", line 45, in __init__
    self.api = APIClient(*args, **kwargs)
  File "/usr/local/lib/python3.6/site-packages/docker/api/client.py", line 197, in __init__
    self._version = self._retrieve_server_version()
  File "/usr/local/lib/python3.6/site-packages/docker/api/client.py", line 222, in _retrieve_server_version
    f'Error while fetching server API version: {e}'
docker.errors.DockerException: Error while fetching server API version: ('Connection aborted.', PermissionError(13, 'Permission denied'))
Build step 'Execute shell' marked build as failure
Finished: FAILURE

```


2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.
4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.
5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.
8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.
9. Сопроводите процесс настройки скриншотами для каждого пункта задания!!

## Необязательная часть

1. Создать скрипт на groovy, который будет собирать все Job, завершившиеся хотя бы раз неуспешно. Добавить скрипт в репозиторий с решением и названием `AllJobFailure.groovy`.
2. Создать Scripted Pipeline так, чтобы он мог сначала запустить через Yandex Cloud CLI необходимое количество инстансов, прописать их в инвентори плейбука и после этого запускать плейбук. Мы должны при нажатии кнопки получить готовую к использованию систему.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
