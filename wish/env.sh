Setenv() {
    if [[ $# -eq 2 ]]
    then
        KEY="${1}"
        VALUE="${2}"
    
        if [[ -z ${!KEY} ]]
        then
            export ${KEY}="${VALUE}"
        fi
    fi
}

## DBF == Database Files (folder); flat-file storage for simple non-relational data
Setenv DBF /www/db

## PATH(folder) where session ids are stored. make sure folder exists. you may use app/lib/_hook-pre.sh for 'mkdir -p ${PATH_SESSION}'
Setenv PATH_SESSION ${DBF}/session

## Cookie lifetime in days added to the current date used in Session()
Setenv COOKIE_LIFETIME 30

## see https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie#samesitesamesite-value
Setenv COOKIE_SAMESITE Strict
