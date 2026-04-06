🚀 AWS CI/CD Pipeline – Jenkins + GitHub + Tomcat
📌 Overview

This project demonstrates an end-to-end CI/CD pipeline built on AWS using Jenkins, GitHub, and Apache Tomcat. The pipeline automates build and deployment of a Java web application (WAR) with zero manual intervention.

🏗️ Architecture
Source Control: GitHub
CI/CD Tool: Jenkins
Build Tool: Maven
Application Server: Apache Tomcat 9
Infrastructure: AWS EC2 (Linux)
🔄 Pipeline Flow
Developer → Git Push → GitHub Webhook → Jenkins Build → Maven Package → WAR → Tomcat Deployment → Live Application
⚙️ Infrastructure Setup
2 EC2 Instances:
Jenkins Server
Application Server (Tomcat)
Security Groups:
Port 22 (SSH)
Port 8080 (Jenkins / Tomcat)
🔧 Tools & Technologies
AWS EC2
Jenkins
Git & GitHub Webhooks
Maven
Apache Tomcat
Linux
🛠️ Implementation Steps
1. Server Setup
Launch EC2 instances
Install Java (JDK)
Configure security groups
2. Jenkins Setup
Install Jenkins
Install required plugins:
Git Plugin
Maven Integration Plugin
Deploy to Container Plugin
3. GitHub Integration
Add SSH key to GitHub

Configure webhook:

http://<jenkins-ip>:8080/github-webhook/
4. Build Configuration
Configure Jenkins job:
Source Code Management → GitHub repo
Branch → main
Build Step → mvn clean install
5. Deployment
Configure Tomcat users:
manager-script role
Deploy WAR file to Tomcat server
📊 Key Features
Automated CI/CD pipeline
Webhook-based trigger (no manual build)
WAR deployment to Tomcat
Branch-based deployment workflow
🚧 Challenges Faced
Jenkins ↔ GitHub webhook connectivity issues
Tomcat role configuration (manager-script)
Port conflicts and security group misconfigurations
Debugging failed Maven builds
📈 Improvements (Next Steps)
Add Docker for containerization
Integrate Kubernetes for orchestration
Implement monitoring (Prometheus + Grafana)
Add rollback strategy for failed deployments



🧠 Learnings
End-to-end CI/CD pipeline setup without managed services
Debugging real-world deployment issues
Importance of automation in reducing deployment time
