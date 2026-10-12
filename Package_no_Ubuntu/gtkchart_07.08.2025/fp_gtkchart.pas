unit fp_gtkchart;

interface

uses
  fp_glib2, fp_gtk4;

const
  {$ifdef linux}
  libgtkchart = 'gtkchart';
  {$endif}

  {$ifdef windows}
  libgtkchart = 'gtkchart.dll'; // ????
  {$endif}

type
  Tbool = boolean;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGtkChartType = ^TGtkChartType;
  TGtkChartType = longint;

const
  GTK_CHART_TYPE_UNKNOWN = 0;
  GTK_CHART_TYPE_LINE = 1;
  GTK_CHART_TYPE_SCATTER = 2;
  GTK_CHART_TYPE_GAUGE_ANGULAR = 3;
  GTK_CHART_TYPE_GAUGE_LINEAR = 4;
  GTK_CHART_TYPE_PIE = 5;
  GTK_CHART_TYPE_COLUMN = 6;
  GTK_CHART_TYPE_NUMBER = 7;

type
  TGtkChart = record
  end;
  PGtkChart = ^TGtkChart;

  TGtkChartClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkChartClass = ^TGtkChartClass;

function gtk_chart_get_type: TGType; cdecl; external libgtkchart;
function gtk_chart_new: PGtkWidget; cdecl; external libgtkchart;
procedure gtk_chart_set_type(chart: PGtkChart; _type: TGtkChartType); cdecl; external libgtkchart;
procedure gtk_chart_set_title(chart: PGtkChart; title: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_label(chart: PGtkChart; _label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_x_label(chart: PGtkChart; x_label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_y_label(chart: PGtkChart; y_label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_x_max(chart: PGtkChart; x_max: double); cdecl; external libgtkchart;
procedure gtk_chart_set_y_max(chart: PGtkChart; y_max: double); cdecl; external libgtkchart;
procedure gtk_chart_set_x_min(chart: PGtkChart; x_min: double); cdecl; external libgtkchart;
procedure gtk_chart_set_y_min(chart: PGtkChart; y_min: double); cdecl; external libgtkchart;
function gtk_chart_get_x_max(chart: PGtkChart): double; cdecl; external libgtkchart;
function gtk_chart_get_x_min(chart: PGtkChart): double; cdecl; external libgtkchart;
function gtk_chart_get_y_max(chart: PGtkChart): double; cdecl; external libgtkchart;
function gtk_chart_get_y_min(chart: PGtkChart): double; cdecl; external libgtkchart;
procedure gtk_chart_set_width(chart: PGtkChart; width: longint); cdecl; external libgtkchart;
procedure gtk_chart_plot_point(chart: PGtkChart; x: double; y: double); cdecl; external libgtkchart;
procedure gtk_chart_set_value(chart: PGtkChart; value: double); cdecl; external libgtkchart;
procedure gtk_chart_set_value_min(chart: PGtkChart; value: double); cdecl; external libgtkchart;
procedure gtk_chart_set_value_max(chart: PGtkChart; value: double); cdecl; external libgtkchart;
function gtk_chart_get_value_min(chart: PGtkChart): double; cdecl; external libgtkchart;
function gtk_chart_get_value_max(chart: PGtkChart): double; cdecl; external libgtkchart;
function gtk_chart_save_csv(chart: PGtkChart; filename: pchar; error: PPGError): Tbool; cdecl; external libgtkchart;
function gtk_chart_save_png(chart: PGtkChart; filename: pchar; error: PPGError): Tbool; cdecl; external libgtkchart;
function gtk_chart_get_points(chart: PGtkChart): PGSList; cdecl; external libgtkchart;
procedure gtk_chart_set_user_data(chart: PGtkChart; user_data: pointer); cdecl; external libgtkchart;
function gtk_chart_get_user_data(chart: PGtkChart): pointer; cdecl; external libgtkchart;
function gtk_chart_set_color(chart: PGtkChart; name: pchar; color: pchar): Tbool; cdecl; external libgtkchart;
procedure gtk_chart_set_font(chart: PGtkChart; name: pchar); cdecl; external libgtkchart;
procedure gtk_chart_add_slice(chart: PGtkChart; value: double; color: pchar; _label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_slice_value(chart: PGtkChart; index: longint; value: double); cdecl; external libgtkchart;
function gtk_chart_set_slice_color(chart: PGtkChart; index: longint; color: pchar): Tbool; cdecl; external libgtkchart;
procedure gtk_chart_set_slice_label(chart: PGtkChart; index: longint; _label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_add_column(chart: PGtkChart; value: double; color: pchar; _label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_column_value(chart: PGtkChart; index: longint; value: double); cdecl; external libgtkchart;
function gtk_chart_set_column_color(chart: PGtkChart; index: longint; color: pchar): Tbool; cdecl; external libgtkchart;
procedure gtk_chart_set_column_label(chart: PGtkChart; index: longint; _label: pchar); cdecl; external libgtkchart;
procedure gtk_chart_set_column_ticks(chart: PGtkChart; ticks: longint); cdecl; external libgtkchart;
function gtk_chart_get_column_max_value(chart: PGtkChart): double; cdecl; external libgtkchart;

// === Konventiert am: 7-4-26 15:57:36 ===

function GTK_TYPE_CHART: TGType;
function GTK_CHART(obj: Pointer): PGtkChart;
function GTK_IS_CHART(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_CHART: TGType;
begin
  Result := gtk_chart_get_type;
end;

function GTK_CHART(obj: Pointer): PGtkChart;
begin
  Result := PGtkChart(g_type_check_instance_cast(obj, GTK_TYPE_CHART));
end;

function GTK_IS_CHART(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_CHART);
end;



end.
