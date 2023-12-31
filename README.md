# wiSH -- web in SHELL

A simple web framework in `bash`

based on (and thanks to):

- https://github.com/msoap/shell2http
- https://github.com/TekWizely/bash-tpl

> this is a POC! it neither claims being secure nor bug-free and is mainly for educational purposes.

# Why?

This project is born from the *wish* of having a system-near control panel with a modern admin-ui being able to execute system/shell commands directly within pages, instead of using these `system()` or `exec()` functions from php, for example.

A full-fledged web framework would be overkill, only to then still abstract the actual system commands to get them executed and that wouldn't even work well with complex structures you're used to from scripts.

Since it's not bound to any framework or language (well, besides bash, of course), you can easily install perl, python, php-cli, go, ruby, and wrap functions around them for specific purposes.

Basically, it's mainly suitable for putting a web-frontend/api on top of existing cli-application(s). Like, providing a web-interface and/or API to a program that doesn't provide one by itself.

# Features

- auth/cookie/session
- secure the whole app or specific Routes/Views/Pages/Fragments for logged-in users via `Guard` or roles (requires https://github.com/sgohl/wish-admin)
- file-based pseudo-database (no relations by default)

# Wiki

https://github.com/sgohl/wiSH/wiki
