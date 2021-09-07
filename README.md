# Non-Default

For pubspec.yaml
firebase_core: "^1.5.0"
cloud_firestore: "^2.5.0"

android => build.gradle
classpath 'com.google.gms:google-services:4.3.8'

android => app =>  build.gradle
apply plugin: 'com.google.gms.google-services'
!defaultConfig {
multiDexEnabled true
}
+dependencies {
     implementation 'com.android.support:multidex:1.0.3'
 }

## Reference
Youtube Link
- [Part 1](https://youtu.be/hkrX_NIztzQ)
- [Part 2](https://youtu.be/GPDtDcAAoSo)

