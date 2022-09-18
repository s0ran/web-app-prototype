git clone -b base/gin https://github.com/s0ran/web-app-prototype.git ${PROJECT_NAME};
cd ${PROJECT_NAME};
mv backend ${BACKEND_NAME};
cd ${BACKEND_NAME};
git remote remove origin;
cd ../;
eval gsed -e 's/{PROJECT_NAME}/$PROJECT_NAME/g' example/Dockerfile.development > ${BACKEND_NAME}/Dockerfile.development;
eval gsed -e 's/{BACKEND_NAME}/$BACKEND_NAME/g' example/docker-compose.development.yml | gsed -e 's/{PROJECT_NAME}/$PROJECT_NAME/g'  > ./docker-compose.development.yml;