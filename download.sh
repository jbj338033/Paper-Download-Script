VERSION=$(curl -s https://api.papermc.io/v2/projects/paper | \
    jq -r '.versions[-1]')
BUILD=$(curl -s https://api.papermc.io/v2/projects/paper/versions/${VERSION}/builds | \
    jq -r '.builds | map(select(.channel == "default") | .build) | .[-1]')
NAME=paper-${VERSION}-${BUILD}.jar
URL="https://api.papermc.io/v2/projects/paper/versions/${VERSION}/builds/${BUILD}/downloads/${NAME}"

curl -o paper.jar $URL
