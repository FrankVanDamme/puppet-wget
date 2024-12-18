class wget::config (
    $tries = '20',
    $reclevel = 5,
    $passive_ftp = 'on',
    $waitretry = 10,
    $http_proxy = undef,
    $https_proxy = undef,
    $timestamping = 'off',
    $httpsonly = 'off',
    Integer $dns_timeout = 10,
    Integer $connect_timeout = 10,
    Integer $read_timeout = 20,
)  {
    file { "/etc/wgetrc":
        mode    => '644',
        content => template("$module_name/wgetrc.erb"),
    }
}
