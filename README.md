# react_slider_shape

A new Flutter package.

## Getting Started

you can customize slider theme in slider overlay shape and
slider thumb shape using this package.

### Example

    @override
      Widget build(BuildContext context) {
        return SliderTheme(
          data: SliderThemeData(
              overlayColor: Colors.pinkAccent[100],
              overlayShape: SliderOverlayReact(overlayRadius: 30),
              thumbColor: Colors.pink,
              trackHeight: 10,
              disabledThumbColor: Colors.amber,
              activeTrackColor: Colors.pinkAccent,
              inactiveTrackColor: Colors.pinkAccent[100].withOpacity(.5),
              thumbShape: CustomSliderThumbReact(
                  disabledThumbRadius: 30, enabledThumbRadius: 14),
              valueIndicatorColor: Colors.white),
          child: Slider(
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                });
              }),
        );
      }




