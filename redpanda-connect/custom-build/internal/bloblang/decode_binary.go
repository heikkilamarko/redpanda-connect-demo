package bloblang

import (
	"encoding/binary"
	"fmt"

	"github.com/redpanda-data/benthos/v4/public/bloblang"
)

func init() {
	decodeBinarySpec := bloblang.NewPluginSpec().
		Param(bloblang.NewStringParam("data_type")).
		Param(bloblang.NewStringParam("byte_order"))

	err := bloblang.RegisterMethodV2("decode_binary", decodeBinarySpec, func(args *bloblang.ParsedParams) (bloblang.Method, error) {
		dataTypeStr, err := args.GetString("data_type")
		if err != nil {
			return nil, err
		}

		byteOrderStr, err := args.GetString("byte_order")
		if err != nil {
			return nil, err
		}

		return func(value any) (any, error) {
			switch data := value.(type) {
			case []byte:
				return decodeBinary(data, dataTypeStr, byteOrderStr)
			default:
				return nil, fmt.Errorf("expected a byte array, received %T", data)
			}
		}, nil
	})
	if err != nil {
		panic(err)
	}
}

func decodeBinary(data []byte, dataTypeStr string, byteOrderStr string) (any, error) {
	var byteOrder binary.ByteOrder

	switch byteOrderStr {
	case "big_endian":
		byteOrder = binary.BigEndian
	case "little_endian":
		byteOrder = binary.LittleEndian
	case "native_endian":
		byteOrder = binary.NativeEndian
	default:
		return nil, fmt.Errorf("unsupported byte order: %s", byteOrderStr)
	}

	switch dataTypeStr {
	case "int":
		return decode[int](data, byteOrder)
	case "int8":
		return decode[int8](data, byteOrder)
	case "int16":
		return decode[int16](data, byteOrder)
	case "int32":
		return decode[int32](data, byteOrder)
	case "int64":
		return decode[int64](data, byteOrder)
	case "uint":
		return decode[uint](data, byteOrder)
	case "uint8":
		return decode[uint8](data, byteOrder)
	case "uint16":
		return decode[uint16](data, byteOrder)
	case "uint32":
		return decode[uint32](data, byteOrder)
	case "uint64":
		return decode[uint64](data, byteOrder)
	case "float32":
		return decode[float32](data, byteOrder)
	case "float64":
		return decode[float64](data, byteOrder)
	default:
		return nil, fmt.Errorf("unsupported data type: %s", dataTypeStr)
	}
}

func decode[T any](buf []byte, order binary.ByteOrder) (any, error) {
	var data T
	if _, err := binary.Decode(buf, order, &data); err != nil {
		return nil, err
	}
	return data, nil
}
