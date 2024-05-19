# projeto-cloud-2024-1

## Requisitos:
- Chave SSH RSA para acessar as instâncias.

## Etapas de implantação

1. Criar um usuário com as permissões necessárias
    
    Como o usuário disponibilizado pelo Insper só tem permissões de IAM, não é possível criar o usuário a partir de um template de *CloudFormation*, portanto, essa etapa deve ser realizada no console da AWS.

    Permissões necessárias: **(por enquanto todas)**
    1. Permissão
    2. Permissão

2. Criar a imagem do servidor web
    1. Criar uma *stack* a partir da *template* `webserver-base-instance.yaml`
3. Implantar a infraestrutura