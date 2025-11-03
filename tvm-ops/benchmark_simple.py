from benchmark_spec import TVMOperatorBenchSpec

class SpecCollection:
    def __init__(self, BASE_DIR):
        self.BASE_DIR = BASE_DIR

    def get_elementwise_specs(self):
        BASE_DIR = self.BASE_DIR

        operator_specs = {
            # Elementwise operators
            "cast":{
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'float32'},
                "output_type": "int32",
                "dtype": "int32"
            },
            "squeeze": {
                "input_shapes": {'A': (1, 128)},
                "output_shape": (128,),
                "axis": [0]
            },
            "expand_dims": {
                "input_shapes": {'A': (128, 1)},
                "output_shape": (128, 1, 1),
                "axis": 1,
                "num_newaxis": 1
            },
            "nn.add": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "multiply": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "nn.relu": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "subtract": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "transpose": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "identity": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "negative": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "exp": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "erf": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "tanh": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "tan": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "cos": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "cosh": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "sin": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "sinh": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "acos": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "acosh": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "asin": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "asinh": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "atan": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "atanh": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "floor": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "ceil": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "trunc": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "abs": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "isnan": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "isfinite": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "isinf": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "round": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "log": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "log2": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "log10": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "sqrt": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "rsqrt": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            },
            "sigmoid": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128)
            }
        }

        specs = [
            TVMOperatorBenchSpec(BASE_DIR, operator_name=op_name, **params)
            for op_name, params in operator_specs.items()
        ]

        return specs

    def get_broadcast_specs(self):
        BASE_DIR = self.BASE_DIR

        operator_specs = {
            # Broadcast operators
            "broadcast_to": {
                "input_shapes": {'A': (128,)},
                "output_shape": (128, 128),
                "shape": (128, 128)
            },
            "add": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "subtract": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "multiply": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "divide": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "floor_divide": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "mod": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "floor_mod": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "maximum": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "minimum": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "power": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128)
            },
            "left_shift": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'int32', 'B': 'int32'},
                "output_type": "int32"
            },
            "right_shift": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'int32', 'B': 'int32'},
                "output_type": "int32"
            },
            "greater": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "less": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "equal": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "not_equal": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "greater_equal": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "less_equal": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "output_type": "bool"
            },
            "logical_and": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'bool', 'B': 'bool'},
                "output_type": "bool"
            },
            "logical_or": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'bool', 'B': 'bool'},
                "output_type": "bool"
            },
            "logical_xor": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'bool', 'B': 'bool'},
                "output_type": "bool"
            },
            "bitwise_and": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'int32', 'B': 'int32'},
                "output_type": "int32"
            },
            "bitwise_or": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'int32', 'B': 'int32'},
                "output_type": "int32"
            },
            "bitwise_xor": {
                "input_shapes": {'A': (128, 128), 'B': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'int32', 'B': 'int32'},
                "output_type": "int32"
            },
            "logical_not": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'bool'},
                "output_type": "bool"
            },
            "bitwise_not": {
                "input_shapes": {'A': (128, 128)},
                "output_shape": (128, 128),
                "input_types": {'A': 'int32'},
                "output_type": "int32"
            }
        }

        specs = [
            TVMOperatorBenchSpec(BASE_DIR, operator_name=op_name, **params)
            for op_name, params in operator_specs.items()
        ]

        return specs
    
    def get_tensorwise(self):
        BASE_DIR = self.BASE_DIR

        operator_specs = {
            'take': {
                "input_shapes": {'A': (128, 64), 'indices': (64,)},
                "output_shape": (64, 64),
                "input_types": {'A': 'float32', 'indices': 'int32'},
                "axis": 0
            },
        }

        specs = [
            TVMOperatorBenchSpec(BASE_DIR, operator_name=op_name, **params)
            for op_name, params in operator_specs.items()
        ]
        return specs

    def get_specs(self):
        elementwise_specs = self.get_elementwise_specs()
        broadcast_specs = self.get_broadcast_specs()
        tensorwise_specs = self.get_tensorwise()
        return tensorwise_specs + elementwise_specs + broadcast_specs
