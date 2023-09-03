#!/bin/bash

echo $1
while IFS= read -r line; 
    do
        env_path=$(echo "$line" | cut -d '|' -f1 |  tr -d " ")
        env_name=$(echo "$line" | cut -d '|' -f2 |  tr -d " ")
        echo "path $env_path env $env_name"
        type=$(aws ssm get-parameters --name $env_path --with-decryption | jq '.Parameters[]' | jq -r '.Type')
        env_value=$(aws ssm get-parameters --name $env_path --with-decryption | jq '.Parameters[]' | jq -r '.Value')
        echo $?
        echo $type
        echo $env_value
        if [ $type == 'SecureString' ]; then
          echo "::add-mask::$env_value"
        fi
        echo "$env_name=$env_value" >> $GITHUB_ENV
    done <<< "$(echo "$1")"
