package main

import (
	"context"

	_ "redpanda-connect-custom-build/internal/bloblang"

	"github.com/redpanda-data/benthos/v4/public/service"
	// _ "github.com/redpanda-data/connect/public/bundle/free/v4"
	_ "github.com/redpanda-data/connect/v4/public/components/io"
	_ "github.com/redpanda-data/connect/v4/public/components/prometheus"
	_ "github.com/redpanda-data/connect/v4/public/components/pure"
)

func main() {
	service.RunCLI(
		context.Background(),
		service.CLIOptSetDefaultConfigPaths("connect.yaml"),
	)
}
