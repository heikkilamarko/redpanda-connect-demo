import 'bootstrap/dist/css/bootstrap.css';
import { wsconnect, JSONCodec } from '@nats-io/nats-core';

const codec = JSONCodec();

document.addEventListener('DOMContentLoaded', async (_event) => {
	const nc = await wsconnect({
		servers: 'ws://localhost:9222',
		name: 'ui',
		timeout: 120_000,
		maxReconnectAttempts: -1,
		waitOnFirstConnect: true
	});

	const sub = nc.subscribe('demo.messages');

	(async () => {
		for await (const msg of sub) {
			handleMsg(msg);
		}
	})();
});

function handleMsg(msg) {
	try {
		const joke = codec.decode(msg.data)?.joke?.value ?? '<empty>';
		const message = document.createElement('div');
		message.classList = 'card p-3 my-2 text-break';
		message.textContent = joke;
		document.querySelector('#messages').appendChild(message);
	} catch (err) {
		console.error(err);
	}
}
