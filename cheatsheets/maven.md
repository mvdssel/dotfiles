Maven Cheatsheet
================

Installatie op OS X
-------------------
[source](http://stackoverflow.com/questions/8826881/maven-install-on-mac-os-x)

    brew install maven

Uitvoeren Main.main(String[] args)
----------------------------------

    mvn exec:java -Dexec.mainClass=packages.to.Main -Dexec.args="arg1 'arg 2' arg3"

Package without tests
---------------------

    mvn package -DskipTests

Copy resources without compilation
----------------------------------

    mvn resources:resources

Install jar, sources & javadoc to local repo
--------------------------------------------
[source](http://stackoverflow.com/questions/9386589/how-to-add-a-jar-source-and-javadoc-to-the-local-maven-repository)

    mvn deploy:deploy-file \
        -DgroupId=tess \
        -DartifactId=core.calculator \
        -Dversion=1.0-SNAPSHOT \
        -Dfile=core.calculator-1.0-SNAPSHOT.jar \
        -Dsources=core.calculator-1.0-SNAPSHOT-sources.jar \
        -Djavadoc=core.calculator-1.0-SNAPSHOT-javadoc.jar \
        -Durl=file:///Users/maartenvandessel/Desktop/hips/HIPS-simulator-and-gui/local-repo

Local JAR
---------
Instead of creating this structure by hand I recommend to use a Maven
plugin to install your jars as artifacts. So, to install an artifact
to an in-project repository under `local-repo` folder execute:

    mvn install:install-file -DlocalRepositoryPath=local-repo -DcreateChecksum=true -Dpackaging=jar -Dfile=[your-jar] -DgroupId=[...] -DartifactId=[...] -Dversion=[...]

If you'll choose this approach you'll be able to simplify the repository declaration in pom to:

    <repository>
        <id>local-repo</id>
        <url>file://${project.baseUri}repo</url>
    </repository>

[source](http://stackoverflow.com/questions/364114/can-i-add-jars-to-maven-2-build-classpath-without-installing-them)

Local project dependencies
--------------------------
1. Create the maven projects
2. Use `mvn clean install` to install the dependency to the local maven repository
3. Add the dependency to the main project using the `pom.xml` file

[source](http://www.avajava.com/tutorials/lessons/how-do-i-add-a-project-as-a-dependency-of-another-project.html)

Command for sub-module
----------------------
Command:

    mvn clean package install -pl <my-submodule> -am

Where:
 - `pl` specifies the sub-module list
 - `am` specifies that the modules required by `pl` should also be build

-Dmaven.multiModuleProjectDirectory
-----------------------------------
[source](http://forums.udacity.com/questions/100295487/-dmavenmultimoduleprojectdirectory-system-propery-is-not-set-check-m2_home-environment-variable-and-mvn-script-match)

Toevoegen als argumenten voor VM:

    -Dmaven.multiModuleProjectDirectory=%M2_HOME%

AspectJ
-------
 - pom.xml configuration: [source](http://stackoverflow.com/questions/12423965/maven-aspectj-all-steps-to-configure-it)
 - com.codehause.mojo plugin: [source](http://stackoverflow.com/questions/12423965/maven-aspectj-all-steps-to-configure-it)
 - language-level settings: [source](http://stackoverflow.com/questions/21548548/adding-aspectj-to-pom-xml-changed-java-version-with-maven-why)
