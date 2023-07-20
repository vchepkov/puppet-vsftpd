class vsftpd (
  Boolean $anonymous_enable = false,
  Boolean $local_enable = true,
  Boolean $write_enable = true,
  String $local_umask = '022',
  String $ftpd_banner = 'FTP Server',
  Boolean $listen_ipv6 = false,
  Boolean $pasv_enable = true,
  Integer $pasv_min_port = 10090,
  Integer $pasv_max_port = 10100,
) {
  package { 'vsftpd': }

  -> file { '/etc/vsftpd/vsftpd.conf':
    ensure  => 'file',
    content => epp('vsftpd/vsftpd.conf.epp'),
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }

  ~> service { 'vsftpd':
    ensure => 'running',
    enable => true,
  }
}
