function run() {
  const root = benthos.v0_msg_as_structured();
  const plugin = require(`./plugins/${root.plugin}.js`);
  root.result = plugin(root.data);
}

run();
