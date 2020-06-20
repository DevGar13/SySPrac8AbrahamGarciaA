%% Animate and Understand Sending and Receiving Messages
% This example shows how to send, receive, and visualize messages. The
% example also shows how to use Simulation Data Inspector, Animation, and
% Storage Inspector to understand how messages flow in your model.
%
% Copyright 2019 The MathWorks, Inc.
%%
model = 'SimpleMessagesModel';
open_system(model);
%% Model Description
% The
% <matlab:openExample('simulink/ModelMessageBasedCommunicationFrameworkExample','supportingFile','SimpleMessagesModel.slx') SimpleMessagesModel>
% contains these blocks:
%
% * <docid:simulink_ref#f8-893976 Sine Wave> &mdash; The signal source. 
% The *Sample time* parameter of the block is set to |0.1|.
%
% * <docid:simulink_ref#bucsbui-1 Send> &mdash; Converts data signals and
% send messages. The specified value for the *Sample time* parameter of the
% Sine Wave block determines the rate at which the Send block sends
% messages. Therefore, the Send block sends one message every |0.1|
% simulation time.
%
% * <docid:simulink_ref#bu30y1a-1 Queue> &mdash; Stores messages. Observe
% the message line between the Send block and the Queue block. The default
% capacity of the queue is |16|, which means the Queue block can store at
% most |16| messages. The default message sorting behavior is |LIFO|, which
% means incoming messages are sorted based on last-in-first-out policy. By
% default, the *Overwrite the oldest element if queue is full* check box is
% selected. When the queue is full, an incoming message overwrites the
% oldest message in the queue. For more information about using the Queue
% block, see <docid:simulink_ug#mw_ef884c98-4fb0-48d5-af25-b0e6c0712db5>.
%
% * <docid:simulink_ref#bucscsk-1 Receive> &mdash; Receives messages and
% converts them to signal data. In the block, *Sample time* parameter
% is set to |0.1|. The Receive block receives a message every
% 0.1 simulation time.
%
% * <docid:simulink_ref#f5-1117037 Scope> &mdash; Visualizes messages
% received by the Receive block.
%% Simulate the Model and Review Results
%
% In the model, data logging is enabled for the signal and message lines
% among Sine Wave, Send, Queue, Receive, and Scope blocks.
%
% Simulate the
% <matlab:openExample('simulink/ModelMessageBasedCommunicationFrameworkExample','supportingFile','SimpleMessagesModel.slx') SimpleMessagesModel>
% and observe from the Simulation Data Inspector that:
% 
% * The Sine Wave block generates the sine wave signal (green).
%
% * Every |0.1| simulation time, Send block converts the value of the
% signal to a message and sends it to the Queue block. Observe that the
% Simulation Data Inspector displays messages as a stem plot (purple).
%
% * The Queue block sends messages to the Receive block (blue).
%
% * Receive block output is the reconstructed sine wave 
% signal (orange).
%
% <<../messages_ex_simple_model_fourplots.png>>
%
%% Use Animation and Storage Inspector
% You can observe the message flow between model components by using
% *Animation* to animate the model. You can specify the speed of the
% animation as |Slow|, |Medium|, or |Fast|. A fourth option |None| disables
% the model animation.
%
% In the model window right-click and select *Animation Speed*, and set its
% speed to |Slow|. Simulate the model again. Observe the highlighted
% message lines representing the message flow between the blocks.
%
%
% <<../messages_ex_simple_model_flow.png>>
%
% Animation highlights message lines and Simulink function calls based on
% event rather than time passed. In one simulation time, more than one
% message flow or Simulink function call event can be highlighted.
%
% Pause the animation. In the Simulink Toolstrip, in the *Debug* tab, click
% *Pause*. Observe that the last highlighted message line is highlighted in
% violet.
%
% <<../messages_ex_simple_model_latestline.png>>
%
% The Storage Inspector allows you to visualize the details of the stored
% messages in Queue block. When you pause the simulation, the Storage
% Inspector magnifying glass icon appears on the Queue block. To open the
% Storage Inspector, click the magnifying glass.
%
% <<../messages_ex_simple_model_queueinspector.png>>
%
% The Storage Inspector does not show any stored messages because
% messages arriving at the Queue block are simultaneously received by the
% Receive block at the same simulation time.
% 
% To create a scenario with stored messages, stop the simulation and change
% the *Sample time* parameter of the Receive block to |0.5|. Now the Send
% block sends one message every |0.1| simulation time, but the
% Receive block receives messages every |0.5| simulation time. This
% causes a backlog of messages that are stored in the Queue block.
%
% Simulate the model again with animation speed set to |Slow|, and pause
% the simulation to check the status in the Storage Inspector. An entity in
% the Storage Inspector represents stored elements in the Queue block, in
% this case, messages. *Storage Inspector* lists the messages stored in the
% Queue block with their ID and data value carried by each message.
%
% <<../messages_ex_simple_model_queueinspector2.png>>
%
%% Display Message Payload as Port Value Labels
%
% You can display message data as port value labels on the block diagram
% during or after a simulation. To display message data, right-click the
% message line emerging from a block and select *Show Value Label of
% Selected Port*.
%
% In the example below, the port values are displayed for the message line
% connecting the Send block to the Queue block. 
%
% <<../message_port_value_display.png>>
%
% If a message carries data as a bus object, you can also select the
% elements to be displayed as the port values. 
%
% The |SimpleMessagesPortValueModel| is a variation of the
% |SimpleMessagesModel| where the input to the Send block comes from a Bus
% Creator block. In this example, a bus object |Data_message| is created
% with two elements, |sinewave| and |constant|.
%
%
% To open this model, enter:
%
%   open_system('SimpleMessagesPortValueModel');
%
% Right-click the message line emerging from the Send block, click |Show
% Value Label of Selected Port|, and select constant.
%
% <<../messages_ex_choose_port_value.png>>
%
% Only the values of the constant signal are displayed as port values.
%
% <<../messages_ex_port_value_display.png>>

