#pragma once

#include <QMainWindow>


class Main_window : public QMainWindow
{
    Q_OBJECT

public:
    Main_window(QWidget *parent = nullptr);
    ~Main_window();

private:
    void setup_ui();    
};