# Comfort Capstone Project 2025

## Description
This is a static website project created as part of my capstone project.
The website is built using a pre-designed HTML and CSS template that I downloaded and customized to fit my project requirements.

It is a simple, responsive static website hosted on Amazon S3.

## Features
- Static HTML and CSS structure
- Fully responsive design
- Hosted using AWS S3
- Publicly accessible via S3 bucket website endpoint

## Folder Structure
/index.html
/css/
/js/
/images/
/README.txt

## Hosting and Deployment
The website is hosted on Amazon S3 using the bucket name:
comfort-capstone-project-2025

Steps I took to deploy:
    1. Created an S3 bucket named comfort-capstone-project-2025.
    2. Unchecked “Block all public access” to make the site publicly readable.
    3. Uploaded my website files (HTML, CSS, JS, and images).
    4. Enabled Static Website Hosting in the bucket properties.
    5. Synced my local files to S3 using the command:
       aws s3 sync . s3://comfort-capstone-project-2025
    6. Accessed the live website through the S3 website endpoint URL.

## Bonus: Automated Deployment with GitHub Actions
The website deployment is automated using GitHub Actions. 
Whenever new files are pushed to the repository:

    1. The workflow automatically syncs the updated website files to the S3 bucket `comfort-capstone-project-2025`.
    2. This ensures the live site always reflects the latest changes without manual uploads.

This automation streamlines deployment and keeps the site up-to-date efficiently.

## Live Website
    http://comfort-capstone-project-2025.s3-website.eu-west-2.amazonaws.com/

## GitHub Repository
    https://github.com/Comfort-Aruo/Capstone-project-website.git

## Credits
    Original template: Generic HTML/CSS template downloaded online
    Modified and customized by Comfort

    Demo Images:
        Unsplash (https://unsplash.com)

    Icons:
        Font Awesome (https://fontawesome.io)

    Other:
        jQuery (https://jquery.com)
        Responsive Tools (https://github.com/ajlkn/responsive-tools)
