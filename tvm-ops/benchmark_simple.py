from benchmark_spec import TVMOperatorBenchSpec

class SpecCollection:
    def __init__(self, BASE_DIR):
        self.BASE_DIR = BASE_DIR

    def get_specs(self):
        BASE_DIR = self.BASE_DIR

        operator_specs = {
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
            }
        }

        specs = [
            TVMOperatorBenchSpec(BASE_DIR, operator_name=op_name, **params)
            for op_name, params in operator_specs.items()
        ]

        return specs
