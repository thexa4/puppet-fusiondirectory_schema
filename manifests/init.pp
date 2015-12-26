class fusiondirectory_schema {
	if ! defined(Apt::Source["fusiondirectory"]) {
		apt::source { "fusiondirectory":
			comment => "Fusiondirectory repository",
			location => "http://repos.fusiondirectory.org/debian-jessie/",
			key => {
				'id' => 'E184859262B4981F',
				'server' => 'keys.gnupg.net',
			},
		}
	}

	$packages = [
		"fusiondirectory-schema",
		"fusiondirectory-plugin-systems-schema",
		"fusiondirectory-plugin-quota-schema",
		"fusiondirectory-plugin-dovecot-schema",
		"fusiondirectory-plugin-samba-schema",
		"fusiondirectory-plugin-gpg-schema",
		"fusiondirectory-plugin-ssh-schema",
		"fusiondirectory-plugin-sudo-schema",
		"fusiondirectory-plugin-repository-schema",
		"fusiondirectory-plugin-freeradius-schema",
		"fusiondirectory-plugin-webservice-schema",
		"fusiondirectory-plugin-mail-schema",
		"fusiondirectory-plugin-dhcp-schema",
		"fusiondirectory-plugin-dns-schema",
		"fusiondirectory-plugin-netgroups-schema",
		"fusiondirectory-plugin-puppet-schema",
		"fusiondirectory-plugin-nagios-schema",
		"fusiondirectory-plugin-apache2-schema",
	]

	Package[$packages] -> Openldap::Server::Schema<| |>

	# base schemas
    openldap::server::schema { "core-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/core-fd.schema", require => [Openldap::Server::Schema["core"], Openldap::Server::Schema["cosine"], Openldap::Server::Schema["samba"]]}
    openldap::server::schema { "core-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/core-fd-conf.schema"}
    openldap::server::schema { "samba": ensure => present, path => "/etc/ldap/schema/fusiondirectory/samba.schema", require => Openldap::Server::Schema["inetorgperson"], before => Openldap::Server::Schema["core-fd"]}
    openldap::server::schema { "recovery-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/recovery-fd.schema"}
    openldap::server::schema { "service-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/service-fd.schema", require => Openldap::Server::Schema["nis"]}

    # service
    openldap::server::schema { "systems-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/systems-fd.schema", require => Openldap::Server::Schema["nis"]}
    openldap::server::schema { "systems-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/systems-fd-conf.schema"}

    # quota
    openldap::server::schema { "quota": ensure => present, path => "/etc/ldap/schema/fusiondirectory/quota.schema", require => Openldap::Server::Schema["nis"] }
    openldap::server::schema { "quota-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/quota-fd.schema"}

    # dovecot
    openldap::server::schema { "dovecot-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/dovecot-fd.schema"}

    # samba
    openldap::server::schema { "samba-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/samba-fd-conf.schema"}

    # gpg
    openldap::server::schema { "gpg-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/gpg-fd.schema"}
    openldap::server::schema { "pgp-remte-prefs": ensure => present, path => "/etc/ldap/schema/fusiondirectory/pgp-remte-prefs.schema", require => Openldap::Server::Schema["core"]}
    openldap::server::schema { "pgp-recon": ensure => present, path => "/etc/ldap/schema/fusiondirectory/pgp-recon.schema", require => Openldap::Server::Schema["core"]}
    openldap::server::schema { "pgp-keyserver": ensure => present, path => "/etc/ldap/schema/fusiondirectory/pgp-keyserver.schema"}

    # ssh
    openldap::server::schema { "openssh-lpk": ensure => present, path => "/etc/ldap/schema/fusiondirectory/openssh-lpk.schema"}

    # sudo
    openldap::server::schema { "sudo": ensure => present, path => "/etc/ldap/schema/fusiondirectory/sudo.schema"}
    openldap::server::schema { "sudo-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/sudo-fd-conf.schema"}

    # repository
    openldap::server::schema { "repository-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/repository-fd.schema"}
    openldap::server::schema { "repository-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/repository-fd-conf.schema"}

    # freeradius
    openldap::server::schema { "freeradius": ensure => present, path => "/etc/ldap/schema/fusiondirectory/freeradius.schema"}

    # webservice
    openldap::server::schema { "webservice-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/webservice-fd-conf.schema"}

    # mail
    openldap::server::schema { "mail-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/mail-fd.schema", require => Openldap::Server::Schema["cosine"]}
    openldap::server::schema { "mail-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/mail-fd-conf.schema"}

    # dhcp
    openldap::server::schema { "dhcp-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/dhcp-fd.schema"}

    # dns
    openldap::server::schema { "dnszone": ensure => present, path => "/etc/ldap/schema/fusiondirectory/dnszone.schema", require => Openldap::Server::Schema["cosine"]}
    openldap::server::schema { "dns-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/dns-fd-conf.schema"}

    # netways
    openldap::server::schema { "netways": ensure => present, path => "/etc/ldap/schema/fusiondirectory/netways.schema", require => Openldap::Server::Schema["core"]}

    # puppet
    openldap::server::schema { "puppet": ensure => present, path => "/etc/ldap/schema/fusiondirectory/puppet.schema"}
    openldap::server::schema { "puppet-fd": ensure => present, path => "/etc/ldap/schema/fusiondirectory/puppet-fd.schema"}

    # nagios
    openldap::server::schema { "nagios-fd-conf": ensure => present, path => "/etc/ldap/schema/fusiondirectory/nagios-fd-conf.schema"}

    # apache2
    openldap::server::schema { "mod_vhost_ldap": ensure => present, path => "/etc/ldap/schema/fusiondirectory/mod_vhost_ldap.schema"}
}

