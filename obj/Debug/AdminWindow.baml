   M S B A M L   `   `   `  ����B  >Library, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:LibraryLibrary  5   	       Library.AdminWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Library     5   	     � Title$&   Библиотека(Админ)��5   	   $	��450��6#   $	��800��60   .��5	      � ���#f4f4f4.+�5
   
   �� 
������� �� CornerRadius$ 10��6$    �� Padding$ 20q�66   $��10q�6C   ._�5      �  � RowDefinitions 5      �� 5      $��* �6$   �� 5      $
��Auto �6$   .+�5      �� $)��#Управление книгами��6   $��18(�5      $
��Bold"�6*   ���#333$��Center=�5      $��0,0,0,10q�69   $��0��6K   &   System.Windows.Controls.DataGrid  5      -   5          Name$ BooksDataGrid��5      $��	0,50,0,20q�5      $��0��5         AutoGenerateColumns .     CanUserAddRows .  ���#f8f8f8���#ccc$��1q�5         RowHeaderWidth$ 0Q�5         ColumnHeaderHeight$ 35Q�5       	   Columns	 5"      0  *System.Windows.Controls.DataGridTextColumn  5#      ,  &System.Windows.Controls.DataGridColumn
   Header$
 ID��6-      Width5  /System.Windows.Controls.DataGridLengthConverter$ 50 6P      
IsReadOnly . 1  +System.Windows.Controls.DataGridBoundColumn   Binding 69   �� *Id+6[     5$      $
 Название��6-   $	 250 6~    6?   �� *Title+ �� UpdateSourceTrigger$ PropertyChanged=�6~     5%      $
 
Автор��6-   $	 200 6|    6<   �� *Author+$ PropertyChanged=�6|   4  .System.Windows.Controls.DataGridCheckBoxColumn  5&      $
 В наличии��61   $	 100 6�    6D   �� *IsAvailable+$ PropertyChanged=�6�   5(      �� 5+       �� Orientation$ 
Horizontal=�6   $��1��66   $��Right=�6C   $��0,10,0,0q�6_   .+�5,      �� -   5        $��Добавить��5,      $	��100��5-      $��35��6)   ���#4CAF50
�������$
��Bold"�5/      
������ $��0,0,10,0q�50      60   �� 51      -   5        $��Удалить��51      $	��100��52      $��35��6)   ���#FF5252
�������$
��Bold"�54      
������ $��0,0,10,0q�55      60   �� 56      -   5        $)��#Посмотреть прокаты��56      $	��150��57      $��35��6)   ���#2196F3
�������$
��Bold"�59      
������ $��0,0,10,0q�5:      60   �� 5;      -   5        $��
Выход��5;      $	��100��5<      $��35��6)   ���#FF6B6B
�������$
��Bold"�5>      
������ 5?      5@      5A      5B      5C      5D      