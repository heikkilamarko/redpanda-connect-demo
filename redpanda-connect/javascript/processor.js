function run() {
  const math = require("mathjs");
  const Fraction = require("fraction.js");
  const dayjs = require("dayjs");
  const utc = require("dayjs/plugin/utc");

  dayjs.extend(utc);

  const root = benthos.v0_msg_as_structured();

  root.result = math.multiply(root.a, root.b);
  root.timestamp = dayjs().add(7, "day").utc().format();
  root.fraction = new Fraction(3, 2);
}

run();
