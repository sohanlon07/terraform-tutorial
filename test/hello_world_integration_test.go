const dbDirStage = "../live/stage/data-stores/mysql"
const appDirStage = "../live/stage/services/hello-world-app"

func TestHelloWorldAppStage(t *Testing.T) {
	t.Parallel()

	//Deploy the MySql DB
	dbOpts := createDbOpts(t, dbDirStage)
}