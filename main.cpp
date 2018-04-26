#include <nodes/NodeData>
#include <nodes/FlowScene>
#include <nodes/FlowView>
#include <nodes/ConnectionStyle>

#include <QtWidgets/QApplication>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QListWidget>

#include <nodes/DataModelRegistry>

#include "NumberSourceDataModel.hpp"
#include "NumberDisplayDataModel.hpp"
#include "AdditionModel.hpp"
#include "SubtractionModel.hpp"
#include "MultiplicationModel.hpp"
#include "DivisionModel.hpp"
#include "ModuloModel.hpp"
#include "DecimalToIntegerModel.hpp"
#include "IntegerToDecimalModel.hpp"

using QtNodes::DataModelRegistry;
using QtNodes::FlowScene;
using QtNodes::FlowView;
using QtNodes::ConnectionStyle;

static std::shared_ptr<DataModelRegistry> registerDataModels()
{
  auto ret = std::make_shared<DataModelRegistry>();
  ret->registerModel<NumberSourceDataModel>("Sources");

  ret->registerModel<NumberDisplayDataModel>("Displays");

  ret->registerModel<AdditionModel>("Operators");

  ret->registerModel<SubtractionModel>("Operators");

  ret->registerModel<MultiplicationModel>("Operators");

  ret->registerModel<DivisionModel>("Operators");

  ret->registerModel<ModuloModel>("Operators");

  ret->registerModel<DecimalToIntegerModel, true>("Type converters");

  ret->registerModel<IntegerToDecimalModel, true>("Type converters");

  return ret;
}


static
void
setStyle()
{
  ConnectionStyle::setConnectionStyle(
  R"(
  {
    "ConnectionStyle": {
      "ConstructionColor": "gray",
      "NormalColor": "black",
      "SelectedColor": "gray",
      "SelectedHaloColor": "deepskyblue",
      "HoveredColor": "deepskyblue",

      "LineWidth": 3.0,
      "ConstructionLineWidth": 2.0,
      "PointDiameter": 10.0,

      "UseDataDefinedColors": true
    }
  }
  )");
}


int
main(int argc, char *argv[])
{
  QApplication app(argc, argv);

  setStyle();

  QWidget mainWidget;

  QListWidget *list = new QListWidget();
  list->setMinimumSize(100, 100);
  list->setMaximumWidth(200);
  list->setSizePolicy(QSizePolicy::Maximum, QSizePolicy::Expanding);

  auto menuBar    = new QMenuBar();
  auto saveAction = menuBar->addAction("Save..");
  auto loadAction = menuBar->addAction("Load..");

  QHBoxLayout *hLayout = new QHBoxLayout();
  hLayout->addWidget(list);
  auto scene = new FlowScene(registerDataModels());
  hLayout->addWidget(new FlowView(scene));
  hLayout->setContentsMargins(5, 5, 5, 5);
  hLayout->setSpacing(5);

  QVBoxLayout *vLayout = new QVBoxLayout();
  vLayout->addWidget(menuBar);
  vLayout->addLayout(hLayout);
  vLayout->setContentsMargins(0, 0, 0, 0);
  vLayout->setSpacing(5);

  QObject::connect(saveAction, &QAction::triggered,
                   scene, &FlowScene::save);

  QObject::connect(loadAction, &QAction::triggered,
                   scene, &FlowScene::load);

  mainWidget.setLayout(vLayout);
  mainWidget.setWindowTitle("Dataflow tools: simplest calculator");
  mainWidget.resize(800, 600);
  mainWidget.showNormal();

  return app.exec();
}
