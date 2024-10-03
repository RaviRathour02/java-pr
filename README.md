USING GITHUB ACTION DEPLOY THIS APP TO AKS USING ECR REPOSITORY FOR IMAGE
------------------------------------------------------------------------------------------
Steps:
1. Make your aks cluster
2. Write work flow 
- Step 1. Install java 
- Step 2. Build with maven
- Step 3. Upload build artifact
- Step 4. List build directory contents
- Step 5. Configure Aws credentials
- Step 6. Login in to amazon ECR
- Step 7. Build docker image
- Step 8. Push docker image to ECR
- Step 9. Azure login
- Step 10. Set up kubelogin for non-interactive login
- Step 11. Get k8s context
- Step 12. Interact and deploy to EKS
IMPORTANT STEPS:
1. Aws configure :
- Add aws credentials into repository secret
• AWS_ACCESS_KEY_ID 
• AWS_SECRET_ACCESS_KEY

2. Azuere login
 - To log in to Azure using GitHub Actions, you can follow these steps:
1. Create a Service Principal:
o Use the Azure CLI to create a Service Principal with the necessary permissions. Run the following command:
               az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/<subscription-id> --sdk-auth
o This command will output a JSON object containing your credentials. Copy this JSON object.

2. Add the Credentials to GitHub Secrets:
o Go to your GitHub repository, navigate to Settings > Secrets and variables > Actions.
o Add a new secret with the name AZURE_CREDENTIALS and paste the JSON object you copied earlier.

3. Create a GitHub Actions Workflow:
- In your repository, create a .github/workflows/azurelogin.yml file with the following content:
- - name: Azure Login
- uses: azure/login@v1
- with:
- creds: ${{ secrets.AZURE_CREDENTIALS }}
3.for deploying a deployment in aks using an image from ecr.
 - aws configure
 - make a secret for ecr-to-eks
 $ kubectl create secret docker-registry ecr-registry-secret --docker-server=559050231342.dkr.ecr.ap-south-1.amazonaws.com --dockerusername=AWS --docker-password=$(aws ecr get-login-password)
- Use the secret into your deployment

