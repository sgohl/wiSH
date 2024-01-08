#!/bin/bash -ea
##
##
##

SOURCE="${BASH_SOURCE[0]}" ; while [ -h "$SOURCE" ]; do
 DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
 SOURCE="$(readlink "$SOURCE")" ; [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done ; DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )" ; cd $DIR

Include() {

	if [[ -f "${1}" ]]
	then

		source "${1}"

	elif [[ -d "${1}" ]]
	then

		for LIB in $(find "${1}" -type f -name "*.sh" 2>/dev/null | sort -n)
		do

			Include ${LIB}

		done

	fi
	
}

## Load sane application defaults
Include env.sh

## Load APP specific .env
Include app/.env

## Load APPENV dependent .env (dev, prod, ...)
Include app/.env.${APPENV}

Include lib
Include app/lib
Include app/plug

# ## Include Plugs
# for LIB in $(find app/plug/*/lib -type f -name "*.sh" 2>/dev/null | sort -n)
# do
# 	Include ${LIB}
# done

## Include final app index.sh
#Include app/index.sh

case ${URI} in

        api*)
                URI=${URI#*/}

                # split URI path into array ${URIPATH[@]}
                IFS='/'; read -ra URIPATH <<< "$URI"; unset IFS
                COMMAND=${URIPATH[0]}

                ## array GETARGS = ${GETARGS[@]}

                source app/api.sh

                for API in $(find app/plug -type f -name api.sh)
                do
                        source $API
                done
        ;;

        admin*)

                Role admin || Redirect
                View ${URI}

        ;;

        *)

                Include app/index.sh

        ;;

esac

