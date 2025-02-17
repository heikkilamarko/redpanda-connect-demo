package main

import (
	"context"

	"github.com/redpanda-data/benthos/v4/public/service"
	// _ "github.com/redpanda-data/connect/public/bundle/free/v4"
	_ "github.com/redpanda-data/connect/v4/public/components/io"
	_ "github.com/redpanda-data/connect/v4/public/components/prometheus"
	_ "github.com/redpanda-data/connect/v4/public/components/pure"

	_ "github.com/united-manufacturing-hub/benthos-umh/opcua_plugin"
)

func main() {
	service.RunCLI(
		context.Background(),
		service.CLIOptSetDefaultConfigPaths("connect.yaml"),
	)
}
