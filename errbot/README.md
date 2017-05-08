
This is a cookbook for automating the installation and configuration of errbot. It sets up the errbot at the system level using `pip` install. The necessary to the errbot to work.

```json
{
    "errbot": {
        "config": {
            "backend": "Hipchat",
            "data_dir": "/opt/errbot/data",
            "extra_plugin_dir": "/opt/errbot/plugins",
            "log_file": "None",
            "log_level": "",
            "identity": {
                "username": "JABBER_ID@chat.hipchat.com",
                "password": "CHANGEME",
                "token": "API_TOKEN"
            },
            "chatroom_presence":"'CHATROOM1',",
            "chatroom_fn": "USERNAME",
            "admins": "'JABBER_ID_ADMIN1@chat.hipchat.com',",
            "alt_prefixes": "'@USERNAME',",
            "xmpp_keepalive_interval": 60
        }
    }
}
```

`errbot.config.backend`: This defines which backend Errbot will try to connect to
`errbot.config.datadir`: The location where all of Errbot's data should be stored.
`errbot.config.extra_plugin_dir`: Set this to a directory on your system where you want to load extra plugins from.
`errbot.config.log_file`: The location of the log file. If you set this to `None`, then logging will happen to console only.
`errbot.config.log_level`: The level of logging that Errbot should spit out.
`errbot.config.identity.username`: Username or Jabber ID of the user, Errbot should use to connect to a channel(backend)
`errbot.config.identity.password`: Password of the user, Errbot should use to connect to a channel(backend)
`errbot.config.identity.token`: API Token of the user, Errbot should use to connect to a channel(backend)
`errbot.config.chatroom.presence`: Comma seperated list of Rooms Errbot should be present on
`errbot.config.chatroom_fn`: Full name of the user, Errbot uses to publish its presence
`errbot.config.admins`: Comma seperated set the admins of your bot. Only these users will have access to the admin-only commands. NOTE: This has to Jabber ID of the users.
`errbot.config.alt_prefixes`: This option allows you to specify alternative prefixes Errbot will respond to in addition to the prefix above.
`errbot.config.xmpp_keepalive_interval`: The keepalive interval at which Errbot publishes to the channel(backend).


