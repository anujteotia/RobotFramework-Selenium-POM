pipeline {
  agent any
  
  stages {
	    stage('initialize') {
	      steps {
	        sh "echo PATH= ${PATH}"
	      }
	    }
    
	    stage('Run Robot Tests') {
	      steps {
		        	sh 'python3 -m robot.run --NoStatusRC Tests/'
		        	sh 'exit 0'
	      		}
	      post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'reports',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
	}    
  }
  
}
