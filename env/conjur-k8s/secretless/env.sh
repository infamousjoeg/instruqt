APP_NAME=testapp-secure
APP_NAMESPACE=testapp
APP_SERVICE_ACCOUNT_NAME=testapp-secure-sa

AUTHENTICATOR_ID="dev"

APP_SECRETS_POLICY_BRANCH="app/testapp/secret"
APP_SECRETS_READER_LAYER="app/testapp/layer"

CONJUR_ACCOUNT="default"
CONJUR_APPLIANCE_URL="https://conjur-cluster-conjur-oss.conjur-server.svc.cluster.local"

CONJUR_ADMIN_AUTHN_LOGIN="admin"
CONJUR_ADMIN_API_KEY="MySecretP@ss1"

OSS_CONJUR_SERVICE_ACCOUNT_NAME="conjur-cluster"
OSS_CONJUR_NAMESPACE="conjur-server"

APP_AUTHENTICATION_CONTAINER_NAME="secretless"
