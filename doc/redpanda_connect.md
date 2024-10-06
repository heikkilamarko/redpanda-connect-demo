# Redpanda Connect

> Redpanda Connect is a declarative data streaming service that solves a wide range of data engineering problems with simple, chained, stateless processing steps. It implements transaction-based resiliency with back pressure, so when connecting to at-least-once sources and sinks it’s able to guarantee at-least-once delivery without needing to persist messages during transit.
>
> It’s simple to deploy, comes with a wide range of connectors, and is totally data agnostic, making it easy to drop into your existing infrastructure. Redpanda Connect has functionality that overlaps with integration frameworks, log aggregators and ETL workflow engines, and can therefore be used to complement these traditional data engineering tools or act as a simpler alternative.

## Introduction

- [Introducing Redpanda Connect](https://www.redpanda.com/blog/redpanda-connect)
- [Official Documentation](https://docs.redpanda.com/redpanda-connect/about/)

## Licensing

| Component                    | License    |
| ---------------------------- | ---------- |
| Redpanda Benthos core engine | MIT        |
| 99%+ of the connectors       | Apache 2.0 |

From https://www.redpanda.com/blog/redpanda-connect

> For developers and engineers who built their entire business on [Redpanda] Benthos, you can continue to do that, as we’re keeping the core engine MIT Licensed. All those hard-to-build, hard-to-test features that made [Redpanda] Benthos so reliable over the years are free and open source for you to use. This is a win for the community that built their business on top of [Redpanda] Benthos – we are so sure of it, we bet the future of Redpanda connectivity on this engine itself.

> For users, this means continued support of 223 Apache 2 Licensed, open source connectors with the large financial backing of Redpanda and customer footprint. It means increased focus on reliability, day 2 operations and security.

## Community

- Active open source community
- [Redpanda Community Slack](https://redpanda.com/slack)

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
