# Redpanda Connect

> Redpanda Connect is a declarative data streaming service that solves a wide range of data engineering problems with simple, chained, stateless processing steps. It implements transaction-based resiliency with back pressure, so when connecting to at-least-once sources and sinks it’s able to guarantee at-least-once delivery without needing to persist messages during transit.
>
> It’s simple to deploy, comes with a wide range of connectors, and is totally data agnostic, making it easy to drop into your existing infrastructure. Redpanda Connect has functionality that overlaps with integration frameworks, log aggregators and ETL workflow engines, and can therefore be used to complement these traditional data engineering tools or act as a simpler alternative.

## Introduction

- [Introducing Redpanda Connect](https://www.redpanda.com/blog/redpanda-connect)
- [Official Documentation](https://docs.redpanda.com/redpanda-connect/about/)

## Development

- [Bloblang (mapping language)](https://docs.redpanda.com/redpanda-connect/guides/bloblang/about/)
- [Metadata](https://docs.redpanda.com/redpanda-connect/configuration/metadata/)
- [Resources (reusing configuration snippets)](https://docs.redpanda.com/redpanda-connect/configuration/resources/)
- [Unit testing](https://docs.redpanda.com/redpanda-connect/configuration/unit_testing/)
- [Error handling](https://docs.redpanda.com/redpanda-connect/configuration/error_handling/)
- [Streams Mode (running multiple pipelines in one instance)](https://docs.redpanda.com/redpanda-connect/guides/streams_mode/about/)

## Deployment

- [Single binary + pipeline YAML file(s)](https://docs.redpanda.com/redpanda-connect/guides/getting_started/)
- [Configuration](https://docs.redpanda.com/redpanda-connect/configuration/)
- [Secrets](https://docs.redpanda.com/redpanda-connect/configuration/secrets/)

## Observability

- [Health Checking (readiness, liveness)](https://docs.redpanda.com/redpanda-connect/guides/monitoring/)
- [Logging](https://docs.redpanda.com/redpanda-connect/components/logger/about/)
- [Metrics](https://docs.redpanda.com/redpanda-connect/components/metrics/about/)
- [Tracing](https://docs.redpanda.com/redpanda-connect/components/tracers/about/)

## Extensibility

- [Custom Plugins Example](https://github.com/redpanda-data/redpanda-connect-plugin-example)

  - [Input](https://github.com/redpanda-data/redpanda-connect-plugin-example/tree/master/input)
  - [Output](https://github.com/redpanda-data/redpanda-connect-plugin-example/tree/master/output)
  - [Processor](https://github.com/redpanda-data/redpanda-connect-plugin-example/tree/master/processor)
  - [Cache](https://github.com/redpanda-data/redpanda-connect-plugin-example/tree/master/cache)
  - [Rate Limit](https://github.com/redpanda-data/redpanda-connect-plugin-example/tree/master/ratelimit)
  - [Bloblang](https://github.com/redpanda-data/redpanda-connect-plugin-example/tree/master/bloblang)

- [Custom Metrics](https://docs.redpanda.com/redpanda-connect/cookbooks/custom_metrics/)
