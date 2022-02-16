#!/bin/sh

url="http://localhost:8080/"
stateChecker=`curl -s "$url" | grep "stateChecker" | sed -E 's/.*value="(.*)".*/\1/g'`

if [[ -z "$stateChecker" ]]
then

echo "*** ERROR: Failed to find the stateChecker value for the Keycloak initial user creation form"
echo "*** You can still check if the default admin user have been previously created : admin/clever"
exit 1

else

curl -s -X POST \
-e "$url" \
-H "Accept: text/html" \
-d "username=admin" \
-d "password=clever" \
-d "passwordConfirmation=clever" \
-d "stateChecker=$stateChecker" \
--cookie "WELCOME_STATE_CHECKER=$stateChecker" \
"$url" > /dev/null

echo "*** One initial default Keycloak admin have been created : admin / clever"

fi
