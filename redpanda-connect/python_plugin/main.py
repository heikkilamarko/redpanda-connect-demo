import asyncio
import logging
from datetime import datetime, timezone
from redpanda_connect import Message, processor, processor_main

logger = logging.getLogger(__name__)


@processor
def yell(msg: Message) -> Message:
    try:
        data = msg.payload
        data["message"] = data["message"].upper()
        data["yelled_at"] = datetime.now(timezone.utc)
        return msg
    except Exception as err:
        logger.error(f"Error processing message: {err}", exc_info=True)
        return msg


if __name__ == "__main__":
    asyncio.run(processor_main(yell))
