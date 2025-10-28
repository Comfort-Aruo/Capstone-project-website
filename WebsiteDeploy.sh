!#/bin/bash
# In this project I am to deploy a static website to AWS S3 using a bash script
# First I will start by enabling the website hosting
BUCKET="comfort-capstone-project-2025"
LOCAL_DIR="$(pwd)"
readonly REGION="eu-west-2"
readonly MAIN_PAGE="index.html"
readonly ERROR_PAGE="error.html"
# Enable static website
enable_hosting() {
    echo "[STEP 1] Activating static website hosting..."
    aws s3 website s3://$BUCKET/ --index-document $MAIN_PAGE --error-document $ERROR_PAGE
    echo "[STEP 1] Website hosting enabled for bucket: $BUCKET"
}
# Set bucket policy to public read
set_bucket_policy() {
    echo "[STEP 2] Applying public read access..."
    POLICY=$(cat <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::$BUCKET/*"
    }
  ]
}
EOF
)
    aws s3api put-bucket-policy --bucket $BUCKET --policy "$POLICY"
    echo "[STEP 2] Public read access granted"
}
# Upload website files
upload_files() {
    echo "[STEP 3] Syncing local files to S3..."
    aws s3 sync $LOCAL_DIR s3://$BUCKET/ --acl public-read
    echo "[STEP 3] Website files uploaded successfully"
}
# Display website URL
show_website_url() {
    echo "--------------------------------------------------"
    echo "✅ Deployment Complete!"
    echo "Your static website is live at:"
    echo "http://$BUCKET.s3-website.$REGION.amazonaws.com"
    echo "--------------------------------------------------"
}
# MAIN SCRIPT EXECUTION
# ==================================================
enable_hosting
set_bucket_policy
upload_files
show_website_url

