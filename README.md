# concouse for docker-compose

## overview

## usage

### for windows

```
PS> ./keys/generate.ps1
:
:
PS> run.ps1
```

### for linux

```
$ ./keys/generate.sh
:
:
$ ./run.sh
```

### ldap auth

```.added_env
CONCOURSE_MAIN_TEAM_LDAP_GROUP=employees
CONCOURSE_LDAP_HOST={ldap host}
CONCOURSE_LDAP_BIND_DN={ldap login user dn}
CONCOURSE_LDAP_BIND_PW={ldap login user password}
CONCOURSE_LDAP_INSECURE_NO_SSL=true

CONCOURSE_LDAP_GROUP_SEARCH_BASE_DN={ladap group dn}
CONCOURSE_LDAP_GROUP_SEARCH_USER_ATTR=member
CONCOURSE_LDAP_GROUP_SEARCH_GROUP_ATTR=description
CONCOURSE_LDAP_GROUP_SEARCH_NAME_ATTR=cn

CONCOURSE_LDAP_USER_SEARCH_BASE_DN={ldap user dn}
CONCOURSE_LDAP_USER_SEARCH_ID_ATTR={ldap user id}
CONCOURSE_LDAP_USER_SEARCH_EMAIL_ATTR=mail
CONCOURSE_LDAP_USER_SEARCH_USERNAME={ldap user name}
```

add team

```
PS> fly -t main login -u http://xxxx:8080
PS> fly -t main set-team -n {team name} --ldap-user xxxxx [--ldap-group xxxx]

roles:
- name: member
  ldap:
    users: ["xxxxx"]
    groups: ["xxxxx"]
```

docs

[LDAP auth](https://concourse-ci.org/ldap-auth.html)

## reference materials

* [Qiita - Concourse CI環境を5分で構築する](https://qiita.com/cacarrot/items/a16e1ad9becfb9210303)
* [GitHub - concourse/concouse-docker](https://github.com/concourse/concourse-docker)
