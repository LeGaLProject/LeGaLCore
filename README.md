# LeGaLCore


### Implementation of NCL Extensions

LeGaL is a declarative language. It is based on the NCL entity concept and has an XML representation. It also inherits the NCL flexibility for temporal synchronism definition. The layout of LeGaL components resembles an NCL document structure. A LeGaL document can be translated into a directed nested graph, where nodes and edges are used to describe LBGs concepts presented in Section~\ref{subsec:game-model}. As we stated, LeGaL is designed for the extension of NCL documents enabling them to model LBGs. In fact, it describes the structure of these games. Thus, the resulting graph of this model represents missions that players must accomplish in an LBG. The graph also includes the composition of missions (media with which the player interacts) and the relationships between the missions and media files. It introduces the game flow, from its inception to its accomplishment. LeGaL graphs use two types of nodes: \textbf{context nodes} (composite nodes), and \textbf {media nodes}. The former represents nesting of nodes in the graph and the latter describes the associated media files. The edges of the graph represent the relationships between the nodes, i.e., the game flow. In LeGaL, ordering and time synchronisation between nodes are defined by the connectors and links.

LeGaL inherits several key NCL and NCM 3.0~\cite{soares2005nested} concepts such as nodes, links, and connectors. For the in-depth understanding of these definitions, the complete NCL documentation can be accessed at NCL Website (http://www.ncl.org.br/en).

There are some new attributes and extensions done to NCL in order to support the modelling of LBGs. This document shows some of these new features.

### Configurable Props
* [occurrence](#occurrence)
* [visibility](#visibility)
* [mandatory](#mandatory)

### Events

### Mission Properties

We add some properties to the context node for representing mission information. For instance, the number of times a mission can be played, which missions are required to be played before playing the others, and others. In example below, we show the use of these properties for the running example description. The occurrence property defines the msSecondChurch mission can be played as many times as the player wants, the mandatory property says the mission is mandatory to finish the game and the visibility sets the mission is always visible to the player. Table contains four of these properties and its possible values.

Property | Values | Description
--- | --- | ---
mandatory | true or false | Defines whether a mission is mandatory.
occurrence | Positive integer | Sets how many times the mission can be executed.
visibility | true or false | Indicates if a mission can be executed.
requirements | List of values | Stores a list of required missions.

``` xml
<context id="msSecondChurch">
  <port id="pSecondChurch" component="locSecondChurch"/>
  <property name="mandatory" value="true"/>
  <property name="occurrence" value="unbounded"/>
  <property name="visibility" value="true"/>

  <media id="locSecondChurch" type="application/gml+xml" src="media/secondChurch.gml"/>
  <media id="mdVideo" type="video/3gpp" src="media/thirdChurchIndicator.3gp"/>
</context>
```

### Game Action and Score

There are four types of actions supported by LeGaL: execute, create, collect, and drop media. We can use the action property to store the desired action when defining a media. The property receives an integer value between 0 and 3 representing the corresponding action. In example above, we don't explicitly set this property in the mdVideo media code, so it assumes the value 0 (execute) by default. The  execute action consists of exhibiting one or more media, such as playing an audio or video, displaying a text or visualising a 3D object. The create action allows players to create their own game media, like images and videos. Additionally, the drop media action enables players to place a media in a determined location and the collect action allow players to collect media placed in a specific location. Table below presents each value.

Value | Description
--- | ---
execute (0) | Run a media.
collect (1) | Catch a media.
create (2) | Create a media.
drop (3) | Drop a media.

At runtime, a player is rewarded with a score for every mission or action completed. The same actions presented in Section~\ref{subsubsec:actions} can have a matching reward. To implement such system, a score property was added to missions and media, thus defining the reward for each action executed by the players. This parameter can assume positive integer values.
