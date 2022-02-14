# !/bin/bash
# Script responsável pelo build, tag e push de imagens no AWS ECR

repo_name=${PWD##*/}
ambiente=$1
conta_aws=$2
regiao=$3

echo "subindo imagem no repositório"
aws ecr get-login-password --region ${regiao} | docker login --username AWS --password-stdin ${conta_aws}.dkr.ecr.${regiao}.amazonaws.com ;
echo "logado com sucesso"

echo "Comecando processo de build da imagem"
docker build -t ${repo_name} . ;

echo "Adicionando a versão da imagem"
docker tag ${repo_name}:latest ${conta_aws}.dkr.ecr.${regiao}.amazonaws.com/${repo_name}:latest ;

echo "Subindo imagem no ECR."
docker push ${conta_aws}.dkr.ecr.${regiao}.amazonaws.com/${repo_name}:latest ;
