# projeto-cloud-2024-1

## Requisitos:
- Usuário com permissões administrativas.

## Implantação
1. Entre com o seu usuário com permissões administrativas no *dashboard* da AWS
2. Navegue até a seção de *CloudFormation*
3. Selecione *Create Stack*
4. Faça o *upload* do arquivo `template.yaml` e clique em *Next*
6. Insira o nome da *stack*, pode ser qualquer nome, desde que pequeno
7. Configure os parâmetros (todos são obrigatórios)
    1. `KeyPairPublicKey`: chave pública SSH RSA, usada somente para *debugging*
    2. `SSHAccessOriginCidr`: sub rede para a qual permitir acesso SSH, <ENDREÇO_IP>/32 para endereço único, usado somente para *debugging*
8. Clique em *Next*
9. Configure as opções extras conforme necessário (não precisa mexer em nada) e clique em *Next*
10. Revise tudo, selecione o *checkbox* ao final e clique em *Submit*
