#/bin/bash
export vault_sa='vault'
export vault_secret_name=$(kubectl get sa $vault_sa \
-o jsonpath="{.secrets[*]['name']}")


 kubectl get secret $vault_secret_name -o json > sec.json

 export jwt_token=$(kubectl get secret $vault_secret_name -o jsonpath=\
"{.data['token']}" | base64 --decode )

 echo 'jwt set'


 export ca_crt=$(kubectl get secret $vault_secret_name -o jsonpath=\
"{.data['ca\.crt']}" | base64 --decode )


 echo 'ca crt set'


 export host=$(minikube ip)


 echo 'host set'


 export vault='docker exec -it cault_vault_1 vault "$@"'

 #$vault auth enable kubernetes


