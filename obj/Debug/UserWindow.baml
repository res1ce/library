   M S B A M L   `   `   `  ����B  >Library, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:LibraryLibrary  5   	       Library.UserWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   'localclr-namespace:Library     5   	     � Title$  Библиотека��5   	   $	��450��6   $	��800��6)   .��5	      � ���#f4f4f4.+�5
   
   �� 
������� �� CornerRadius$ 10��6$    �� Padding$ 20q�66   $��10q�6C   ._�5      � .+�5      �� $��Список книг��6   $��18(�5      $
��Bold"�6*   ���#333$��Center=�5      $��0,0,0,10q�69   �� 5      -   5         ��Name$ BooksListView��5      $��	0,50,0,70q�5      ���#f8f8f8���#ccc$��1q�5   C    �� View 5      �� 5      .P�5      �� $��ID��6-    �� Width$ 50��6]    �� DisplayMemberBinding 69   �� *Id+6]   �� 5      $��Название��6-   $	 300��6f    6?   �� *Title+6f   �� 5      $��
Автор��6-   $	 200��6d    6<   �� *Author+6d   5      5      �� 5       �� Orientation$ 
Horizontal=�6   $��Right=�66   $��Bottom=�6R   $��0,0,0,10q�6m   .+�5       �� -   5        $ ��Взять в прокат��5       $	��150��5!      $��35��6)   ���#007ACC
�������$
��Bold"�5#      
������ $��0,0,10,0q�5$      6/   �� 5%      -   5        $��
Выход��5%      $	��100��5&      $��35��6)   ���#FF6B6B
�������$
��Bold"�5(      
������ 5)      5*      5+      5,      5-      5.      