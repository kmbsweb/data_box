{
  type: 'CHART',
  name: null,
  generalConfiguration: {
    inverted: false,
    polar: false,
    optimizedForPrinting: false,
    width: null,
    height: null,
    zoomType: 'XY',
    style: {
      backgroundColor: null,
      plotBackgroundColor: null
    }
  },
  titleConfiguration: {
    enabled: true,
    title: 'Apply Forecast',
    subTitle: null,
    titleStyle: {
      color: null,
      fontSize: 14,
      bold: false,
      italic: false
    },
    subTitleStyle: {
      color: null,
      fontSize: null,
      bold: false,
      italic: false
    },
    horizontalAlignment: 'CENTER'
  },
  tooltipConfiguration: {
    enabled: true,
    shared: false,
    valuePrefix: null,
    valueSuffix: null,
    valueDecimals: null
  },
  legendConfiguration: {
    enabled: true,
    title: null,
    layout: 'HORIZONTAL',
    horizontalAlignment: 'CENTER',
    verticalAlignment: 'BOTTOM',
    style: {
      color: null,
      fontSize: null,
      bold: true,
      italic: false
    }
  },
  colorAxisConfiguration: {
    id: '1cbd6cd9-438b-42fd-882b-05926f5fc928',
    minValue: null,
    maxValue: null,
    logarithmic: false,
    coloringType: 'GRADIENT',
    colorBins: [
      {
        from: null,
        to: 0,
        color: 'rgba(103,143,248,1.0)',
        name: null
      },
      {
        from: 0,
        to: null,
        color: 'rgba(239,64,64,1.0)',
        name: null
      }
    ],
    colorStops: [
      {
        point: 0,
        color: 'rgba(103,143,248,1.0)'
      },
      {
        point: 0.5,
        color: 'rgba(247,247,164,1.0)'
      },
      {
        point: 1,
        color: 'rgba(239,64,64,1.0)'
      }
    ],
    labelConfiguration: {
      enabled: true,
      format: null,
      labelInterval: 0,
      style: {
        color: null,
        fontSize: null,
        bold: false,
        italic: false
      }
    }
  },
  plotConfigurations: [
    {
      columns: [
        'Monthly milk production / pounds per cow',
        'Monthly milk production / pounds per cow and forecast'
      ],
      plotType: 'line',
      stackingType: 'NONE',
      additionalColumns: {},
      aggregationConfiguration: {
        enabled: false,
        groupByColumns: [],
        aggregationFunction: 'COUNT',
        aggregationParameter: null
      },
      styleConfiguration: {
        visible: true,
        markersEnabled: false,
        showInLegend: true,
        colors: null,
        lineWidth: 2,
        areaFillOpacity: 0.7,
        markerSize: 4,
        markerFillOpacity: 0.5,
        lineType: 'SOLID',
        markerShape: 'CIRCLE',
        dataLabelConfiguration: {
          enabled: false,
          format: null,
          style: {
            color: null,
            fontSize: null,
            bold: false,
            italic: false
          },
          filter: {
            enabled: false,
            filterOperator: 'GREATER_THAN',
            filterProperty: 'y',
            filterValue: null
          }
        }
      },
      typeSpecificConfiguration: {
        configuration: {}
      },
      yaxisId: 'y1'
    }
  ],
  yaxisConfigurations: [
    {
      id: 'y1',
      minValue: null,
      maxValue: null,
      logarithmic: false,
      plotLines: [],
      styleConfiguration: {
        title: null,
        titleStyle: {
          color: null,
          fontSize: null,
          bold: false,
          italic: false
        },
        opposite: false,
        reversed: false,
        decimalsAllowed: true,
        visible: true,
        tickInterval: null,
        axisColor: null,
        gridLineType: 'SOLID',
        gridLineColor: null,
        gridLineWidth: null,
        labelConfiguration: {
          enabled: true,
          format: null,
          labelInterval: 0,
          style: {
            color: null,
            fontSize: null,
            bold: false,
            italic: false
          }
        }
      }
    }
  ],
  xaxisConfiguration: {
    id: 'x1',
    minValue: null,
    maxValue: null,
    logarithmic: false,
    plotLines: [],
    column: 'Date',
    styleConfiguration: {
      title: null,
      titleStyle: {
        color: null,
        fontSize: null,
        bold: false,
        italic: false
      },
      opposite: false,
      reversed: false,
      decimalsAllowed: true,
      visible: true,
      tickInterval: null,
      axisColor: null,
      gridLineType: 'SOLID',
      gridLineColor: null,
      gridLineWidth: null,
      labelConfiguration: {
        enabled: true,
        format: null,
        labelInterval: 0,
        style: {
          color: null,
          fontSize: null,
          bold: false,
          italic: false
        }
      }
    }
  },
  zaxisConfiguration: {
    id: 'ead0bee4-035a-4069-8113-92b0b2c26893',
    minValue: null,
    maxValue: null,
    logarithmic: false,
    plotLines: [],
    styleConfiguration: {
      title: null,
      titleStyle: {
        color: null,
        fontSize: null,
        bold: false,
        italic: false
      },
      opposite: false,
      reversed: false,
      decimalsAllowed: true,
      visible: true,
      tickInterval: null,
      axisColor: null,
      gridLineType: 'SOLID',
      gridLineColor: null,
      gridLineWidth: null,
      labelConfiguration: {
        enabled: true,
        format: null,
        labelInterval: 0,
        style: {
          color: null,
          fontSize: null,
          bold: false,
          italic: false
        }
      }
    }
  }
}