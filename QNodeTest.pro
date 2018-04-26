QT += core
QT += opengl

CONFIG += c++11

TARGET = QNodeTest
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

INCLUDEPATH += $$PWD/nodes/internal

SOURCES += main.cpp \
    DecimalToIntegerModel.cpp \
    IntegerToDecimalModel.cpp \
    MathOperationDataModel.cpp \
    ModuloModel.cpp \
    NumberDisplayDataModel.cpp \
    NumberSourceDataModel.cpp \
    src/Connection.cpp \
    src/ConnectionBlurEffect.cpp \
    src/ConnectionGeometry.cpp \
    src/ConnectionGraphicsObject.cpp \
    src/ConnectionPainter.cpp \
    src/ConnectionState.cpp \
    src/ConnectionStyle.cpp \
    src/DataModelRegistry.cpp \
    src/FlowScene.cpp \
    src/FlowView.cpp \
    src/FlowViewStyle.cpp \
    src/Node.cpp \
    src/NodeConnectionInteraction.cpp \
    src/NodeDataModel.cpp \
    src/NodeGeometry.cpp \
    src/NodeGraphicsObject.cpp \
    src/NodePainter.cpp \
    src/NodeState.cpp \
    src/NodeStyle.cpp \
    src/Properties.cpp \
    src/StyleCollection.cpp

HEADERS += \
    AdditionModel.hpp \
    DecimalData.hpp \
    DecimalToIntegerModel.hpp \
    DivisionModel.hpp \
    IntegerData.hpp \
    IntegerToDecimalModel.hpp \
    MathOperationDataModel.hpp \
    ModuloModel.hpp \
    MultiplicationModel.hpp \
    NumberDisplayDataModel.hpp \
    NumberSourceDataModel.hpp \
    SubtractionModel.hpp \
    src/ConnectionBlurEffect.hpp \
    src/ConnectionPainter.hpp \
    src/NodeConnectionInteraction.hpp \
    src/NodePainter.hpp \
    src/Properties.hpp \
    src/StyleCollection.hpp \
    nodes/internal/Compiler.hpp \
    nodes/internal/Connection.hpp \
    nodes/internal/ConnectionGeometry.hpp \
    nodes/internal/ConnectionGraphicsObject.hpp \
    nodes/internal/ConnectionState.hpp \
    nodes/internal/ConnectionStyle.hpp \
    nodes/internal/DataModelRegistry.hpp \
    nodes/internal/Export.hpp \
    nodes/internal/FlowScene.hpp \
    nodes/internal/FlowView.hpp \
    nodes/internal/FlowViewStyle.hpp \
    nodes/internal/make_unique.hpp \
    nodes/internal/Node.hpp \
    nodes/internal/NodeData.hpp \
    nodes/internal/NodeDataModel.hpp \
    nodes/internal/NodeGeometry.hpp \
    nodes/internal/NodeGraphicsObject.hpp \
    nodes/internal/NodePainterDelegate.hpp \
    nodes/internal/NodeState.hpp \
    nodes/internal/NodeStyle.hpp \
    nodes/internal/OperatingSystem.hpp \
    nodes/internal/PortType.hpp \
    nodes/internal/QStringStdHash.hpp \
    nodes/internal/QUuidStdHash.hpp \
    nodes/internal/Serializable.hpp \
    nodes/internal/Style.hpp \
    nodes/Connection \
    nodes/ConnectionStyle \
    nodes/DataModelRegistry \
    nodes/FlowScene \
    nodes/FlowView \
    nodes/FlowViewStyle \
    nodes/Node \
    nodes/NodeData \
    nodes/NodeDataModel \
    nodes/NodeGeometry \
    nodes/NodePainterDelegate \
    nodes/NodeStyle

RESOURCES += \
    resources/resources.qrc
