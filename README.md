# Thyme Frontend
based on Ember App Kit

## S3 

### Setup
Go to the [S3 Management Console](https://console.aws.amazon.com/s3/home) and create a new S3 bucket. Let's call it my-thyme-bucket.

Edit the bucket's properties, go to "Static Website Hosting" and click "Enable website hosting." Enter index.html for both the "Index document" and "Error document" fields. This will ensure all requests go to the Ember app.

Save these settings and click on "Permissions." Click "Add Bucket Policy" and paste in the following (replacing `my-thyme-bucket` with your own bucket name).
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AddPerm",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-thyme-bucket/*"
    }
  ]
}
```
This allows all files on the web host to be automatically accessible to all users. Save this policy, and save your bucket permissions.

Now, you need to get access keys for uploading the files to S3. Go to the [IAM Management Console](https://console.aws.amazon.com/iam/home) and add a new user (you can call it the same thing as your bucket). Download the security credentials when the users are created.

Click on your new user in the user list and go to the "Permissions" tab for that user. Click "Attach User Policy" and add a policy such as this which allows reading and writing to your bucket. Again, replace `my-thyme-bucket` with your own bucket name.
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1396991223000",
      "Effect": "Allow",
      "Action": [
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::my-thyme-bucket/*"
      ]
    }
  ]
}
```

Seems kinda complicated. I agree.

### Configuration

Now, you need to set the app's configuration for accessing your newly created bucket. Either set the config variables specified in [tasks/options/s3.js](blob/master/tasks/options/s3.js) or add the credentials directly to the file (you might want to remove it from git if you do this so that others don't see it).

The s3 region can be seen in your bucket's static web host URL (static hosting URLs are of the format http://[bucket name].s3-website-[bucket region].amazonaws.com). Get the Access Key ID and Secret Access Key from the csv file you downloaded from Amazon after creating your new IAM user.

Copy [config/environments/production.js.sample](blob/master/config/environments/production.js.sample) to config/environments/production.js and add the host of the thyme backend you'll be using. Also, in your thyme backend, be sure the URL of your client is present as a regex in your configuration's clients array so that requests will be allowed from your client.

### Deployment
Run `grunt deploy` in the project's root and to the internet it will go.
