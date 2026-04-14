import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.example.learn_flutter"
            resValue(type = "string", name = "app_name", value = "Prod")
        }
        create("development") {
            dimension = "flavor-type"
            applicationId = "com.example.learn_flutter.dev"
            resValue(type = "string", name = "app_name", value = "[DEV]")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationId = "com.example.learn_flutter.stag"
            resValue(type = "string", name = "app_name", value = "[STAG]")
        }
    }
}